

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/services/language_provider.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/share_utils.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/home/presentation/widgets/episode_card.dart';
import 'package:webrofm/features/home/presentation/widgets/show_card.dart';
import 'package:webrofm/features/profile/presentation/providers/profile_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';
import 'package:webrofm/shared/widgets/local_cached_image.dart';
import 'package:webrofm/shared/widgets/content_disclaimer.dart';
import 'package:webrofm/shared/widgets/mini_player_widget.dart';

final showDetailProvider = FutureProvider.autoDispose.family<Show?, String>((ref, showId) async {
  final repository = ref.read(showRepositoryProvider);
  final result = await repository.getTrending();
  final shows = result.fold(
    (_) => <Show>[],
    (data) => data,
  );
  return shows.firstWhereOrNull((s) => s.id == showId);
});

class _LangOption {
  final String code;
  final String label;
  const _LangOption(this.code, this.label);
}

class ShowDetailScreen extends ConsumerStatefulWidget {
  final String showId;

  const ShowDetailScreen({super.key, required this.showId});

  @override
  ConsumerState<ShowDetailScreen> createState() => _ShowDetailScreenState();
}

class _ShowDetailScreenState extends ConsumerState<ShowDetailScreen> {
  bool _isExpanded = false;
  bool _isBookmarked = false;
  int _selectedSeason = 1;
  String _selectedLang = 'hi';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifierProvider.notifier).fetchShowEpisodes(widget.showId);
      _checkBookmarked();
    });
  }

  Future<void> _checkBookmarked() async {
    final result = await ref.read(profileRepositoryProvider).getFavorites();
    if (!mounted) return;
    result.fold(
      (_) {},
      (shows) => setState(() {
        _isBookmarked = shows.any((s) => s.id == widget.showId);
      }),
    );
  }

  Future<void> _toggleBookmark(Show show) async {
    final result = await ref
        .read(showRepositoryProvider)
        .toggleFavorite(int.tryParse(show.id) ?? -1);
    if (!mounted) return;
    result.fold(
      (failure) => context.showSnackBar(failure.message, isError: true),
      (isFav) => setState(() => _isBookmarked = isFav),
    );
  }

  List<int> _availableSeasons(List<Episode> episodes) {
    final seasons = episodes.map((e) => e.seasonNumber).toSet().toList()..sort();
    return seasons.isEmpty ? const [1] : seasons;
  }

  List<Episode> _seasonEpisodes(List<Episode> episodes, int season) {
    return episodes.where((e) => e.seasonNumber == season).toList();
  }

  int _effectiveSeason(List<Episode> episodes) {
    final seasons = _availableSeasons(episodes);
    return seasons.contains(_selectedSeason) ? _selectedSeason : seasons.first;
  }

  bool _matchesLang(Episode ep, String label) =>
      _episodeMatchesLang(ep, _selectedLang, label);

  List<_LangOption> _buildLanguageOptions(Show show, List<Episode> episodes, AppLocalizations l10n) {
    final list = <_LangOption>[];
    final seen = <String>{};
    void add(String code, String label) {
      final key = code.trim().toLowerCase();
      if (key.isEmpty || seen.contains(key)) return;
      seen.add(key);
      list.add(_LangOption(code, label));
    }

    for (final e in episodes) {
      final code = (e.languageCode ?? '').trim().toLowerCase();
      final name = (e.languageName ?? '').trim();
      if (code.isEmpty && name.isEmpty) continue;

      String label = name.isNotEmpty ? name : code;
      if (code == 'hi' || name.toLowerCase() == 'hindi') {
        label = l10n.languageHindi;
      } else if (code == 'en' || name.toLowerCase() == 'english') {
        label = l10n.languageEnglish;
      }
      add(code.isNotEmpty ? code : name.toLowerCase(), label);
    }

    if (list.isEmpty && show.language != null && show.language!.trim().isNotEmpty) {
      final showLang = show.language!.trim();
      final lower = showLang.toLowerCase();

      if (lower.contains('hi') || lower.contains('hindi')) {
        add('hi', l10n.languageHindi);
      }
      if (lower.contains('en') || lower.contains('english')) {
        add('en', l10n.languageEnglish);
      }
      if (list.isEmpty) {
        add(lower, showLang);
      }
    }

    if (list.isEmpty) {
      add('hi', l10n.languageHindi);
    }

    return list;
  }

  bool _episodeMatchesLang(Episode ep, String code, String label) {
    final lcode = (ep.languageCode ?? '').toLowerCase();
    final lname = (ep.languageName ?? '').toLowerCase();
    if (lcode.isEmpty && lname.isEmpty) return true;
    if (lcode == code) return true;
    if (lname.contains(label.toLowerCase())) return true;
    if (code == 'hi' && lname.contains('हिंदी')) return true;
    return false;
  }

  bool _hasEpisodesInLang(List<Episode> episodes, int season, String code, String label) {
    final seasonList = episodes.where((e) => e.seasonNumber == season).toList();
    return seasonList.any((e) => _episodeMatchesLang(e, code, label));
  }

  void _onLanguageSelected(String code, String label, List<Episode> episodes) {
    if (_selectedLang == code) return;
    final season = _effectiveSeason(episodes);
    if (_hasEpisodesInLang(episodes, season, code, label)) {
      setState(() => _selectedLang = code);
    } else {
      final l10n = AppLocalizations.of(context);
      if (l10n != null) {
        context.showSnackBar(l10n.episodeNotAvailableInLanguage(label));
      }
    }
  }

  List<Episode> _filteredEpisodes(List<Episode> episodes, List<_LangOption> langs) {
    final seasonList = _seasonEpisodes(episodes, _effectiveSeason(episodes));
    if (langs.length <= 1) {
      return seasonList;
    }
    final label = langs
        .firstWhere(
          (l) => l.code.toLowerCase() == _selectedLang.toLowerCase(),
          orElse: () => _LangOption(_selectedLang, _selectedLang),
        )
        .label;
    final filtered = seasonList.where((e) => _matchesLang(e, label)).toList();
    return filtered.isNotEmpty ? filtered : seasonList;
  }

  Widget _buildSeasonTabs(BuildContext context, ColorScheme cs, List<Episode> episodes) {
    final l10n = AppLocalizations.of(context)!;
    final seasons = _availableSeasons(episodes);
    if (seasons.length <= 1) {
      return Text(
        l10n.seasonLabel(seasons.first),
        style: context.textTheme.titleMedium?.copyWith(
          color: cs.primary,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final season in seasons)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => setState(() => _selectedSeason = season),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: season == _selectedSeason
                        ? cs.primary
                        : cs.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    l10n.seasonLabel(season),
                    style: context.textTheme.labelLarge?.copyWith(
                      color: season == _selectedSeason ? cs.onPrimary : cs.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLanguageToggle(BuildContext context, ColorScheme cs, List<Episode> episodes, List<_LangOption> langs) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < langs.length; i++) ...[
            if (i > 0) const SizedBox(width: 3),
            _buildLangPill(context, cs, langs[i].code, langs[i].label, episodes),
          ],
        ],
      ),
    );
  }

  Widget _buildLangPill(BuildContext context, ColorScheme cs, String code, String label, List<Episode> episodes) {
    final selected = _selectedLang == code;
    return GestureDetector(
      onTap: () => _onLanguageSelected(code, label, episodes),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? cs.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: selected ? cs.onPrimary : cs.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildEpisodeControls(BuildContext context, ColorScheme cs, List<Episode> episodes, List<_LangOption> langs) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildSeasonTabs(context, cs, episodes)),
        const SizedBox(width: 8),
        _buildLanguageToggle(context, cs, episodes, langs),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final homeState = ref.watch(homeNotifierProvider);
    final showAsync = ref.watch(showDetailProvider(widget.showId));
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      bottomNavigationBar: const MiniPlayerWidget(),
      body: showAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline_rounded, size: 48, color: cs.error),
              const SizedBox(height: 12),
              Text(l10n.showDetailFailed, style: context.textTheme.titleMedium),
            ],
          ),
        ),
        data: (show) {
          if (show == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off_rounded, size: 48, color: cs.onSurface.withValues(alpha: 0.4)),
                  const SizedBox(height: 12),
                  Text(l10n.showDetailNotFound, style: context.textTheme.titleMedium),
                ],
              ),
            );
          }
          return Stack(
            children: [
              _buildContent(context, cs, show, homeState),
              _FloatingActions(
                isBookmarked: _isBookmarked,
                onBack: () => context.pop(),
                onBookmark: () => _toggleBookmark(show),
                onShare: () => ShareUtils.shareShow(title: show.title, showId: show.id),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ColorScheme cs, Show show, HomeState homeState) {
    return CustomScrollView(
      slivers: [
        _buildHeroSection(context, cs, show),
        SliverToBoxAdapter(
          child: _buildContentSection(context, cs, show, homeState),
        ),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, ColorScheme cs, Show show) {
    final topPadding = MediaQuery.of(context).padding.top;
    final hasImage = (show.backdropUrl ?? show.posterUrl)?.isNotEmpty == true;
    final imageWidth = MediaQuery.of(context).size.width - 32;

    return SliverToBoxAdapter(
      child: Container(
        color: cs.surfaceContainerHighest,
        padding: EdgeInsets.fromLTRB(16, topPadding + 50, 16, 16),
        child: hasImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: LocalCachedImage(
                  imageUrl: show.backdropUrl ?? show.posterUrl,
                  width: imageWidth,
                  fit: BoxFit.fitWidth,
                  borderRadius: 0,
                  placeholder: (_, __) => AspectRatio(
                    aspectRatio: 1130 / 1600,
                    child: _shimmerBox(context),
                  ),
                  errorWidget: (_, __, ___) => Container(
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.broken_image_outlined, size: 64, color: cs.onSurface.withValues(alpha: 0.3)),
                  ),
                ),
              )
            : const SizedBox(height: 200),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context, ColorScheme cs, Show show, HomeState homeState) {
    final l10n = AppLocalizations.of(context)!;
    final userLang = ref.watch(languageProvider).languageCode;
    final displayDesc = show.descriptionFor(userLang);
    final langs = _buildLanguageOptions(show, homeState.currentEpisodes, l10n);

    if (langs.isNotEmpty && !langs.any((l) => l.code.toLowerCase() == _selectedLang.toLowerCase())) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _selectedLang != langs.first.code) {
          setState(() {
            _selectedLang = langs.first.code;
          });
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            show.title,
            style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildBadge(context, Icons.star_rounded, show.rating.toStringAsFixed(1), Colors.amber.shade600),
              if (langs.isNotEmpty)
                _buildBadge(context, Icons.language_rounded, langs.map((l) => l.label).join(' / '), cs.primary)
              else if (show.language != null && show.language!.isNotEmpty)
                _buildBadge(context, Icons.language_rounded, show.language!, cs.primary),
              if (show.category != null)
                _buildBadge(context, Icons.category_rounded, show.category!, cs.secondary),
              if (show.ageRating != null)
                _buildBadge(context, Icons.person_outline_rounded, show.ageRating!, cs.error),
              if (show.authorName != null && show.authorName!.isNotEmpty)
                _buildBadge(context, Icons.groups_rounded, show.authorName!, const Color(0xFF2E7D32)),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            displayDesc.isNotEmpty ? displayDesc : l10n.showDetailNoDescription,
            style: context.textTheme.bodyLarge?.copyWith(
              color: cs.onSurface.withValues(alpha: 0.8),
              height: 1.5,
            ),
            maxLines: _isExpanded ? null : 3,
            overflow: _isExpanded ? null : TextOverflow.ellipsis,
          ),
          if (displayDesc.length > 100)
            GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _isExpanded ? l10n.showDetailReadLess : l10n.showDetailReadMore,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
          const ContentDisclaimer(),
          const SizedBox(height: 20),
          Text(l10n.showDetailEpisodes, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          if (homeState.isLoading && homeState.currentEpisodes.isEmpty)
            ...List.generate(3, (_) => _buildShimmerEpisode(context))
          else if (homeState.currentEpisodes.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  l10n.showDetailNoEpisodes,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
            )
          else ...[
            _buildEpisodeControls(
              context,
              cs,
              homeState.currentEpisodes,
              langs,
            ),
            const SizedBox(height: 12),
            ..._filteredEpisodes(
              homeState.currentEpisodes,
              langs,
            ).map((episode) => EpisodeCard(
                  episode: episode,
                  onPlay: () => context.push('/video-player/${episode.showId}', extra: episode),
                  onTap: () => context.push('/video-player/${episode.showId}', extra: episode),
                )),
          ],
          if (homeState.moreLikeThis.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(l10n.showDetailMoreLikeThis, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeState.moreLikeThis.length,
                itemBuilder: (context, index) {
                  final related = homeState.moreLikeThis[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ShowCard(
                      show: related,
                      onTap: () => context.push('/show/${related.id}'),
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildBadge(BuildContext context, IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(label, style: context.textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildShimmerEpisode(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
    final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        child: Container(
          height: 80,
          decoration: BoxDecoration(color: base, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _shimmerBox(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
    final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Container(color: base),
    );
  }
}

class _FloatingActions extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onBack;
  final VoidCallback onBookmark;
  final VoidCallback onShare;

  const _FloatingActions({
    required this.isBookmarked,
    required this.onBack,
    required this.onBookmark,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top + 8;
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _glassButton(context, Icons.arrow_back_rounded, onBack),
            const Spacer(),
            _glassButton(
              context,
              isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
              onBookmark,
            ),
            const SizedBox(width: 8),
            _glassButton(context, Icons.share_rounded, onShare),
          ],
        ),
      ),
    );
  }

  Widget _glassButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: context.surfaceWhite(),
          shape: BoxShape.circle,
          border: Border.all(color: context.glassBorder(), width: 1),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 20, offset: const Offset(0, 4)),
          ],
        ),
        child: Icon(icon, size: 20, color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
