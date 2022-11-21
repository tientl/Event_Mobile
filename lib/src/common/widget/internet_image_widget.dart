import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InternetImageWidget extends StatelessWidget {
  final String? imgUrl;
  final double width;
  final double height;
  final double borderRadius;
  final String replaceImgUrl;
  final BoxFit fit;
  final double circularProgressIndicatorRadius;

  const InternetImageWidget(
      {super.key,
      required this.imgUrl,
      this.borderRadius = 10,
      this.width = 60,
      this.height = 60,
      this.replaceImgUrl = 'images/default/images.jpeg',
      this.fit = BoxFit.cover,
      this.circularProgressIndicatorRadius = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: imgUrl != null && imgUrl!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imgUrl!,
              placeholder: (context, url) => Center(
                child: SizedBox(
                  height: circularProgressIndicatorRadius,
                  width: circularProgressIndicatorRadius,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: fit,
            )
          : Image.asset(
              replaceImgUrl,
              fit: fit,
            ),
    );
  }
}
