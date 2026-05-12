import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Maps the original `https://dimg.dreamflow.cloud/v1/image/...` URLs that
/// were baked into this app to local asset paths bundled in the APK.
///
/// This lets the app render its intended imagery offline / without any
/// backend, while preserving the exact same visual design as when the
/// remote URLs were reachable.
const Map<String, String> _kDreamflowImageAssets = {
  'https://dimg.dreamflow.cloud/v1/image/Syria%20flag%20icon':
      'assets/images/dreamflow/syria_flag_icon.jpg',
  'https://dimg.dreamflow.cloud/v1/image/physics%20laboratory%20equipment':
      'assets/images/dreamflow/physics_laboratory_equipment.jpg',
  'https://dimg.dreamflow.cloud/v1/image/arabic%20calligraphy%20manuscript':
      'assets/images/dreamflow/arabic_calligraphy_manuscript.jpg',
  'https://dimg.dreamflow.cloud/v1/image/molecular%20structure%203d':
      'assets/images/dreamflow/molecular_structure_3d.jpg',
  'https://dimg.dreamflow.cloud/v1/image/math%20blackboard':
      'assets/images/dreamflow/math_blackboard.jpg',
  'https://dimg.dreamflow.cloud/v1/image/biology%20cell%20structure':
      'assets/images/dreamflow/biology_cell_structure.jpg',
  'https://dimg.dreamflow.cloud/v1/image/historical%20ruins%20syria':
      'assets/images/dreamflow/historical_ruins_syria.jpg',
  'https://dimg.dreamflow.cloud/v1/image/arabic%20calligraphy':
      'assets/images/dreamflow/arabic_calligraphy.jpg',
  'https://dimg.dreamflow.cloud/v1/image/physics%20teacher%20drawing%20wave%20diagrams%20on%20blackboard':
      'assets/images/dreamflow/physics_teacher_wave_diagrams.jpg',
  'https://dimg.dreamflow.cloud/v1/image/Damascus%20University%20Logo':
      'assets/images/dreamflow/damascus_university_logo.jpg',
  'https://dimg.dreamflow.cloud/v1/image/Aleppo%20University%20Logo':
      'assets/images/dreamflow/aleppo_university_logo.jpg',
  'https://dimg.dreamflow.cloud/v1/image/Tishreen%20University%20Logo':
      'assets/images/dreamflow/tishreen_university_logo.jpg',
  'https://dimg.dreamflow.cloud/v1/image/SVU%20Logo':
      'assets/images/dreamflow/svu_logo.jpg',
};

const Map<String, String> _kDreamflowLottieAssets = {
  'https://dimg.dreamflow.cloud/v1/lottie/student+studying+offline+with+books+and+lightbulb':
      'assets/jsons/dreamflow/student_studying_offline.json',
};

String? _localAssetForImage(String url) => _kDreamflowImageAssets[url];

String? _localAssetForLottie(String url) => _kDreamflowLottieAssets[url];

/// Drop-in replacement for `CachedNetworkImage` that prefers a locally
/// bundled asset when the URL is known, and otherwise falls back to the
/// network (with a graceful placeholder and error widget so the UI never
/// shows a blank box if the request fails).
class DreamflowImage extends StatelessWidget {
  const DreamflowImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final assetPath = _localAssetForImage(imageUrl);
    if (assetPath != null) {
      return Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        errorBuilder: (_, __, ___) => _placeholder(context),
      );
    }
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 0),
      fadeOutDuration: const Duration(milliseconds: 0),
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment is Alignment ? alignment as Alignment : Alignment.center,
      placeholder: (_, __) => _placeholder(context),
      errorWidget: (_, __, ___) => _placeholder(context),
    );
  }

  Widget _placeholder(BuildContext context) => Container(
        width: width,
        height: height,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        alignment: Alignment.center,
        child: Icon(
          Icons.image_outlined,
          size: 24,
          color: Theme.of(context).colorScheme.outline,
        ),
      );
}

/// Drop-in replacement for `Lottie.network(...)` that prefers a locally
/// bundled asset when the URL is known, with a quiet fallback if the
/// animation cannot be resolved.
class DreamflowLottie extends StatelessWidget {
  const DreamflowLottie({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.animate = true,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final assetPath = _localAssetForLottie(url);
    if (assetPath != null) {
      return Lottie.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        animate: animate,
        errorBuilder: (_, __, ___) => _fallback(),
      );
    }
    return Lottie.network(
      url,
      width: width,
      height: height,
      fit: fit,
      animate: animate,
      errorBuilder: (_, __, ___) => _fallback(),
    );
  }

  Widget _fallback() => SizedBox(width: width, height: height);
}
