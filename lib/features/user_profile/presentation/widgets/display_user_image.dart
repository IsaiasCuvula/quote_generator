import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/common/common.dart';

class DisplayUserImage extends StatelessWidget {
  const DisplayUserImage({
    super.key,
    required this.imageUrl,
    this.radius,
    this.isCircleAvatar = true,
  });

  final String imageUrl;
  final double? radius;
  final bool isCircleAvatar;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.error,
          color: context.colorScheme.primary,
          size: Dimensions.iconSizeSmall,
        ),
      ),
      imageBuilder: (context, imageProvider) => isCircleAvatar
          ? CircleAvatar(
              maxRadius: radius,
              backgroundImage: imageProvider,
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
