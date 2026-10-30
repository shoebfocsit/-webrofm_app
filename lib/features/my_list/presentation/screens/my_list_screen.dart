import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/profile/presentation/providers/profile_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';
import 'package:webrofm/shared/widgets/local_cached_image.dart';

class MyListScreen extends ConsumerStatefulWidget {
  const MyListScreen({super.key});

  @override
  ConsumerState<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends ConsumerState<MyListScreen> {
  bool _isLoading = true;
  String? _error;
  List<Show> _saved = [];
  final Set<String> _removingIds = {};

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    final result = await ref.read(profileRepositoryProvider).getFavorites();
    if (!mounted) return;
    result.fold(
      (failure) => setState(() {
        _isLoading = false;
        _error = failure.message;
      }),
      (shows) => setState(() {
        _isLoading = false;
        _saved = shows;
      }),
    );
  }

  Future<void> _removeFavorite(Show show) async {
    if (_removingIds.contains(show.id)) return;
    setState(() => _removingIds.add(show.id));
    final result = await ref
        .read(showRepositoryProvider)
        .toggleFavorite(int.tryParse(show.id) ?? -1);
    if (!mounted) return;
    setState(() => _removingIds.remove(show.id));
    result.fold(
      (failure) => context.showSnackBar(failure.message, isError: true),
      (_) {
        context.showSnackBar(AppLocalizations.of(context)!.myListRemoved);
        _loadFavorites();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final isLoggedIn = ref.watch(authProvider).isLoggedIn;

    return Scaffold(
      body: Stack(
        children: [
          const GradientMeshBackground(
            colors: [
              Color(0xFFae3115),
              Color(0xFF603ed3),
              Color(0xFFff6b4a),
            ],
            animate: true,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Text(
                    AppLocalizations.of(context)!.myListTitle,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: !isLoggedIn
                      ? _buildLoginPrompt(context, cs)
                      : _buildContent(context, cs),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, ColorScheme cs) {
    if (_isLoading) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
          final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Shimmer.fromColors(
              baseColor: base,
              highlightColor: highlight,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: base,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        },
      );
    }

    if (_error != null) {
      return _buildErrorState(context, cs);
    }

    if (_saved.isEmpty) {
      return _buildEmptyState(context, cs);
    }

    return RefreshIndicator(
      onRefresh: _loadFavorites,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _saved.length,
        itemBuilder: (context, index) {
          final show = _saved[index];
          return _buildSavedItem(context, cs, show);
        },
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context, ColorScheme cs) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GlassCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.bookmark_border_rounded,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.myListLoginTitle,
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.myListLoginSubtitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 24),
              GlassButton(
                text: l10n.profileLogin,
                icon: Icons.login_rounded,
                onPressed: () => context.push('/login'),
                foregroundColor: Colors.white,
                backgroundColor: cs.primary.withValues(alpha: 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, ColorScheme cs) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded, size: 48, color: Colors.white70),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.myListError,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          GlassButton(
            text: AppLocalizations.of(context)!.commonRetry,
            icon: Icons.refresh_rounded,
            onPressed: _loadFavorites,
            foregroundColor: Colors.white,
            backgroundColor: cs.primary.withValues(alpha: 0.9),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedItem(BuildContext context, ColorScheme cs, Show show) {
    final isRemoving = _removingIds.contains(show.id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(
              color: context.surfaceWhite(),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: context.glassBorder(),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.push('/show/${show.id}'),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: cs.surfaceContainerHighest,
                      child: show.posterUrl != null
                          ? LocalCachedImage(
                              imageUrl: show.posterUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              borderRadius: 0,
                            )
                          : Icon(Icons.movie_outlined, color: cs.onSurface.withValues(alpha: 0.3)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.push('/show/${show.id}'),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            show.title,
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          if (show.description != null)
                            Text(
                              show.description!,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: cs.onSurface.withValues(alpha: 0.6),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: isRemoving ? null : () => _removeFavorite(show),
                    icon: isRemoving
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: cs.primary,
                            ),
                          )
                        : Icon(Icons.bookmark_rounded, color: cs.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ColorScheme cs) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: context.surfaceWhite(),
              shape: BoxShape.circle,
              border: Border.all(
                color: context.glassBorder(),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.bookmark_border_rounded,
              size: 48,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.myListNoSaved,
            style: context.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.myListNoSavedSubtitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          GlassButton(
            text: AppLocalizations.of(context)!.myListExploreShows,
            icon: Icons.explore_rounded,
            onPressed: () => context.go('/categories'),
            foregroundColor: Colors.white,
            backgroundColor: cs.primary.withValues(alpha: 0.9),
          ),
        ],
      ),
    );
  }
}
