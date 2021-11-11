import 'package:flutter/material.dart';
import 'package:kitty_world/model/cat_fact.dart';
import 'package:kitty_world/resources/general_theme.dart';

class FactDetailsContainer extends StatelessWidget {

  ///
  /// Main expandable - vertically - container for the content details
  const FactDetailsContainer({
    Key? key,
    required this.catFact,
  }) : super(key: key);

  final CatFact catFact;

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
              Padding(
                padding: AppTheme.edge16,
                child: Text(
                  catFact.fact,
                  textAlign: TextAlign.justify,
                  style: AppTheme.textStyleLarge21,
                ),
              ),
              Padding(
                padding: AppTheme.edge8,
                child: Text(
                  "length: ${catFact.length.toString()}",
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
