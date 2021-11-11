import 'package:flutter/material.dart';
import 'package:kitty_world/model/cat_fact.dart';
import 'package:kitty_world/ui/detail_screen/view/fact_details_view.dart';
import 'package:kitty_world/ui/shared_elements/main_layout.dart';

class DetailsScreen extends StatelessWidget {
  ///
  /// Fact detail_screen screen - a Wrapper around [FactDetailsView]
  ///
  /// It contains [MainLayout] and [FactDetailsView]
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CatFact;

    return MainLayout(
      animationConfiguration: (animationController) => {
        animationController.forward()
      },
        child: FactDetailsView(catFact: args));
  }
}
