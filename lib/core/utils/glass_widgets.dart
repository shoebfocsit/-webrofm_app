import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:webrofm/core/utils/extensions.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? blurIntensity;
  final double? borderOpacity;
  final List<BoxShadow>? boxShadow;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final Clip clipBehavior;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.height,
    this.width,
    this.backgroundColor,
    this.blurIntensity,
    this.borderOpacity,
    this.boxShadow,
    this.decoration,
    this.foregroundDecoration,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(16);
    final bgColor = backgroundColor ?? context.surfaceWhite();
    final blur = blurIntensity ?? 8.0;
    final borderOp = borderOpacity ?? 0.45;
    return Container(
      height: height,
      width: width,
      margin: margin ?? EdgeInsets.zero,
      decoration:
          decoration ??
          BoxDecoration(
            boxShadow:
                boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
          ),
      foregroundDecoration: foregroundDecoration,
      clipBehavior: clipBehavior,
      child: ClipRRect(
        borderRadius: radius is BorderRadius
            ? radius
            : BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            padding: padding ?? const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius is BorderRadius
                  ? radius
                  : BorderRadius.circular(16),
              border: Border.all(
                color: context.glassBorder(opacity: borderOp),
                width: 1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Widget? iconWidget;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? blurIntensity;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final TextStyle? textStyle;
  final bool isLoading;
  final bool isDisabled;
  final Widget? suffix;

  const GlassButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.iconWidget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.blurIntensity,
    this.height,
    this.width,
    this.padding,
    this.borderRadius = 28,
    this.textStyle,
    this.isLoading = false,
    this.isDisabled = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bgColor = backgroundColor ?? context.surfaceWhite();
    final fgColor = foregroundColor ?? cs.primary;
    final blur = blurIntensity ?? 8.0;

    final effectiveDisabled = isDisabled || isLoading;

    return SizedBox(
      height: height ?? 56,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Material(
            color: effectiveDisabled ? bgColor.withValues(alpha: 0.4) : bgColor,
            borderRadius: BorderRadius.circular(borderRadius),
            child: InkWell(
              onTap: effectiveDisabled ? null : onPressed,
              borderRadius: BorderRadius.circular(borderRadius),
              splashColor: fgColor.withValues(alpha: 0.1),
              highlightColor: fgColor.withValues(alpha: 0.05),
              child: Container(
                padding:
                    padding ??
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    color: effectiveDisabled
                        ? Colors.white.withValues(alpha: 0.2)
                        : (borderColor ?? context.glassBorder()),
                    width: 1,
                  ),
                ),
                child: ClipRect(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isLoading)
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: fgColor,
                          ),
                        )
                      else ...[
                        if (icon != null) ...[
                          Icon(icon, size: 20, color: fgColor),
                          const SizedBox(width: 10),
                        ],
                        if (iconWidget != null) ...[
                          iconWidget!,
                          const SizedBox(width: 10),
                        ],
                      ],
                      Flexible(
                        child: Text(
                          isLoading ? 'Please wait...' : text,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyle ??
                              TextStyle(
                                color: fgColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Outfit',
                                letterSpacing: 0.5,
                              ),
                        ),
                      ),
                      if (suffix != null) ...[
                        const SizedBox(width: 8),
                        suffix!,
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? initialValue;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final double? blurIntensity;
  final double? borderRadius;
  final VoidCallback? onTap;
  final bool autofocus;
  final TextCapitalization textCapitalization;

  const GlassInput({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.initialValue,
    this.focusNode,
    this.contentPadding,
    this.backgroundColor,
    this.blurIntensity,
    this.borderRadius,
    this.onTap,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<GlassInput> createState() => _GlassInputState();
}

class _GlassInputState extends State<GlassInput> {
  bool _obscured = false;

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? 14;
    final bgColor = widget.backgroundColor ?? context.surfaceWhite();
    final blur = widget.blurIntensity ?? 8.0;

    final effectiveKeyboardType =
        widget.keyboardType == TextInputType.text &&
            widget.textInputAction == TextInputAction.newline &&
            widget.maxLines != 1
        ? TextInputType.multiline
        : widget.keyboardType;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          validator: widget.validator,
          keyboardType: effectiveKeyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscured,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          autofocus: widget.autofocus,
          textCapitalization: widget.textCapitalization,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
            fontFamily: 'Outfit',
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            errorText: widget.errorText,
            filled: true,
            fillColor: bgColor,
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: context.glassBorder(),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: context.glassBorder(),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                    ),
                    onPressed: () => setState(() => _obscured = !_obscured),
                  )
                : widget.suffixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            isDense: false,
            floatingLabelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontFamily: 'Outfit',
              backgroundColor: bgColor,
            ),
            labelStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
              fontFamily: 'Outfit',
            ),
            hintStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.4),
              fontFamily: 'Outfit',
            ),
            errorStyle: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
              fontFamily: 'Outfit',
            ),
            counterStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.4),
              fontSize: 12,
              fontFamily: 'Outfit',
            ),
          ),
        ),
      ),
    );
  }
}

class GlassBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<GlassBottomNavItem> items;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final double? height;

  const GlassBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.margin,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = cs.primary;
    final bgColor =
        backgroundColor ??
        (isDark
            ? const Color(0xFF1A2332).withValues(alpha: 0.85)
            : Colors.white.withValues(alpha: 0.78));
    final navHeight = height ?? 64;

    return Container(
      height: navHeight,
      margin: margin ?? const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                bgColor,
                isDark
                    ? const Color(0xFF141D2B).withValues(alpha: 0.9)
                    : Colors.white.withValues(alpha: 0.95),
              ],
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == currentIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isSelected ? item.activeIcon : item.icon,
                        size: 22,
                        color: isSelected
                            ? primary
                            : cs.onSurface.withValues(alpha: 0.45),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected
                              ? primary
                              : cs.onSurface.withValues(alpha: 0.45),
                          fontFamily: 'Outfit',
                          letterSpacing: 0.3,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(top: 2),
                        width: isSelected ? 16 : 0,
                        height: 2.5,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class GlassBottomNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const GlassBottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

class GradientMeshBackground extends StatefulWidget {
  final List<Color> colors;
  final Widget? child;
  final bool animate;

  const GradientMeshBackground({
    super.key,
    this.colors = const [
      Color(0xFFae3115),
      Color(0xFF603ed3),
      Color(0xFFff6b4a),
      Color(0xFF795aee),
    ],
    this.child,
    this.animate = false,
  });

  @override
  State<GradientMeshBackground> createState() => _GradientMeshBackgroundState();
}

class _GradientMeshBackgroundState extends State<GradientMeshBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) {
      return _buildMesh(context, 0);
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => _buildMesh(context, _animation.value),
    );
  }

  Widget _buildMesh(BuildContext context, double animValue) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = isDark
        ? const [
            Color(0xFF3A1A0E),
            Color(0xFF221447),
            Color(0xFF5E2212),
            Color(0xFF2E1C55),
          ]
        : widget.colors;
    final alpha = isDark ? 0.16 : 0.4;
    return Stack(
      children: [
        CustomPaint(
          size: Size.infinite,
          painter: _MeshGradientPainter(
            colors: colors,
            animationValue: animValue,
            alpha: alpha,
          ),
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }
}

class _MeshGradientPainter extends CustomPainter {
  final List<Color> colors;
  final double animationValue;
  final double alpha;

  _MeshGradientPainter({
    required this.colors,
    required this.animationValue,
    this.alpha = 0.4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centers = <Offset>[];
    final radii = <double>[];

    for (var i = 0; i < colors.length; i++) {
      final phase = (i / colors.length) * 2 * pi;
      final offsetX = sin(animationValue * 0.5 + phase) * size.width * 0.1;
      final offsetY = cos(animationValue * 0.3 + phase) * size.height * 0.1;

      centers.add(
        Offset(
          size.width * (0.2 + 0.6 * (i / max(1, colors.length - 1))) + offsetX,
          size.height * (0.2 + 0.6 * (i / max(1, colors.length - 1))) + offsetY,
        ),
      );
      radii.add(
        size.width * 0.4 + sin(animationValue + phase) * size.width * 0.05,
      );
    }

    for (var i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            colors[i].withValues(alpha: alpha),
            colors[i].withValues(alpha: 0.0),
          ],
          stops: const [0.0, 1.0],
        ).createShader(Rect.fromCircle(center: centers[i], radius: radii[i]));

      canvas.drawCircle(centers[i], radii[i], paint);
    }
  }

  @override
  bool shouldRepaint(_MeshGradientPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue ||
      oldDelegate.alpha != alpha ||
      oldDelegate.colors != colors;
}
