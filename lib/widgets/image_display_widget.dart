import 'package:flutter/material.dart';

/// Widget to display the insights icon image from assets
class InsightsIconWidget extends StatelessWidget {
  final double size;
  final BoxFit fit;

  const InsightsIconWidget({
    super.key,
    this.size = 80.0,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/insights_icon.png',
      width: size,
      height: size,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        // Fallback if image fails to load
        return Icon(Icons.broken_image, size: size, color: Colors.grey);
      },
    );
  }
}

/// Widget to display any image from assets with custom styling
class AssetImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  const AssetImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: Icon(
            Icons.broken_image,
            size: (width ?? 50) * 0.5,
            color: Colors.grey[600],
          ),
        );
      },
    );

    if (borderRadius != null || backgroundColor != null) {
      imageWidget = Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: imageWidget,
        ),
      );
    }

    return imageWidget;
  }
}
