import 'package:flutter/material.dart';
import 'package:kitty_world/resources/animation_util.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/resources/link_resources.dart';

class ImageHolder extends StatelessWidget {
  ///
  /// It uses placeholder, on-error placeholder to replace any missing content
  const ImageHolder({
    Key? key,
    required this.randomImageUrl,
  }) : super(key: key);

  final String randomImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.edge8,
      child: ClipRRect(
        borderRadius: AppTheme.borderRadius,
        child: FadeInImage.assetNetwork(
          width: 90,
          height: 90,
          fadeInDuration: AnimationUtil.shortPeriod,
          image: randomImageUrl,
          placeholder: LinkResources.assetImage,
          placeholderErrorBuilder: (c, e, s) =>
              Container(width: 90,height: 90,color: AppTheme.colorPinkLowest,),
          imageErrorBuilder: (c, e, s) => Image.asset(
            LinkResources.assetImage,
            width: 90,
            height: 90,
          ),
        ),
      ),
    );
  }
}
