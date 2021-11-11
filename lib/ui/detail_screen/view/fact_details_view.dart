import 'package:flutter/material.dart';
import 'package:kitty_world/model/detail_view_argument.dart';
import 'package:kitty_world/ui/detail_screen/view/widgets/fact_details_container.dart';
import 'package:kitty_world/ui/shared_elements/fact_number_index.dart';

class FactDetailsView extends StatelessWidget {
  final DetailViewArgument details;
  const FactDetailsView({Key? key, required this.details}) : super(key: key);

  /// A simple layout wrapper around the content and its ui belongings
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            FactDetailsContainer(details:details),
            Positioned(
              bottom: 4,
              right: 6,
              child: FactNumberIndex(
                positionOnList: details.positionOnList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
