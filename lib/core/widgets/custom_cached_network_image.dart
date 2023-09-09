import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      placeholder: (context, url) => const CustomLoadingIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageUrl: imageUrl,
    );
  }
}
