import 'package:flutter/material.dart';
import 'package:kitty_world/model/detail_view_argument.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/ui/main_screen/views/fact/widgets/image_holder.dart';

class FactDetailsContainer extends StatelessWidget {

  ///
  /// Main expandable - vertically - container for the content details
  const FactDetailsContainer({
    Key? key,
    required this.details,
  }) : super(key: key);

  final DetailViewArgument details;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: AppTheme.edge21,
          width: MediaQuery.of(context).size.width,
          decoration: AppTheme.boxDecorationWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageHolder(
                randomImageUrl: details.imageUrl,
                borderClip: AppTheme.borderAllClipped,
              ),
              Padding(
                padding: AppTheme.edge16,
                child: Text(
                  details.fact.fact,
                  textAlign: TextAlign.justify,
                  style: AppTheme.textStyleLarge21,
                ),
              ),
              Padding(
                padding: AppTheme.edge8,
                child: Text(
                  "length: ${details.fact.length.toString()}",
                  style: AppTheme.textStyleLarge18,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
