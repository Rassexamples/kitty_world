import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kitty_world/model/cat_fact.dart';
import 'package:kitty_world/model/detail_view_argument.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/resources/text_resources.dart';
import 'package:kitty_world/ui/main_screen/views/fact/widgets/fact_container.dart';
import 'package:kitty_world/ui/shared_elements/button.dart';
import 'package:kitty_world/ui/shared_elements/main_layout.dart';


class FactsView extends StatefulWidget {
  final int fetchListSize;
  final Function(int index) imageUrl;
  final List<CatFact> facts;
  final Function(DetailViewArgument item) onTap;
  final ScrollController scrollController;

  ///
  /// Main view of the application that shows list of contents
  ///
  /// [scrollController] - It triggers the viewmodel to load more data
  const FactsView(
      {Key? key,
      required this.scrollController,
      required this.fetchListSize,
      required this.imageUrl,
      required this.facts,
      required this.onTap})
      : super(key: key);

  @override
  State<FactsView> createState() => _FactsViewState();
}

class _FactsViewState extends State<FactsView> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      animationConfiguration: (animationController) =>
          {_handleBackgroundAnimation(animationController)},
      child: WillPopScope(
        onWillPop: () => _onPopUp(),
        child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          controller: widget.scrollController,
          separatorBuilder: (context, index) =>
              _getSeparatorWidget(widget.fetchListSize, index),
          itemCount: widget.facts.length,
          itemBuilder: (context, index) => FactItemContainer(
            index: index,
            randomImageUrl: widget.imageUrl(index),
            catFact: widget.facts[index],
            onTap: () {
              DetailViewArgument item =
              DetailViewArgument(widget.facts[index], widget.imageUrl(index),index + 1);
              widget.onTap(item);
            },
          ),
        ),
      ),
    );
  }

  ///
  /// It returns a widget to separate the content items by the source pagination logic
  Widget _getSeparatorWidget(int fetchListSize, int index) {
    if (index != 0 && (index + 1) % fetchListSize == 0) {
      return Container(
        margin: AppTheme.edge21,
        decoration: BoxDecoration(
          color: AppTheme.colorPinkLow,
          shape: BoxShape.circle,
        ),
        height: 21,
      );
    } else {
      return const SizedBox();
    }
  }

  ///
  /// It handles physical back-pressed button by showing a dialog box
  Future<bool> _onPopUp() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.colorWhiteLow,
        title: const Text(
          (TextResource.dialogTitle),
          textAlign: TextAlign.justify,
        ),
        actions: [
          KittyButton(
            onTap: () => Navigator.of(context).pop(true),
            content: TextResource.dialogExitButton,
            color: AppTheme.colorWhiteLow,
            textColor: Colors.black,
          ),
          KittyButton(
            onTap: () => Navigator.of(context).pop(false),
            content: TextResource.dialogStayButton,
            color: AppTheme.colorPinkLow,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void _handleBackgroundAnimation(AnimationController ac) {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        ac.stop();
        ac.forward();
      } else {
        ac.stop();
        ac.reverse();
      }
    });
  }
}
