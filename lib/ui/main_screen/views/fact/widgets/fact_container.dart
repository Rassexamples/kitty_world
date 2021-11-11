import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitty_world/model/cat_fact.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/resources/link_resources.dart';
import 'package:kitty_world/ui/main_screen/views/fact/widgets/fact_description.dart';
import 'package:kitty_world/ui/shared_elements/fact_number_index.dart';
import 'package:kitty_world/ui/main_screen/views/fact/widgets/image_holder.dart';
import 'package:kitty_world/util/extensions.dart';

class FactItemContainer extends StatelessWidget {
  final CatFact catFact;
  final int index;
  final Function() onTap;
  final String randomImageUrl;

  ///
  /// Basic Container to present the single item
  const FactItemContainer(
      {Key? key,
      required this.catFact,
      required this.onTap,
      required this.randomImageUrl,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: AppTheme.boxDecorationWhite,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    ImageHolder(randomImageUrl: randomImageUrl),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 4,
                      height: 50,
                      color: AppTheme.colorPinkLow,
                    ),
                    Flexible(
                      flex: 3,
                      child: FactDescription(catFact: catFact),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 6,
            child: FactNumberIndex(positionOnList: index + 1),
          ),
        ],
      ),
    );
  }
}
