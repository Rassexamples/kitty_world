import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitty_world/resources/animation_util.dart';
import 'package:kitty_world/resources/link_resources.dart';
import 'package:kitty_world/ui/shared_elements/background.dart';
import 'package:kitty_world/ui/shared_elements/appbar.dart';
class MainLayout extends StatefulWidget {
  final Widget child;
  final Function(AnimationController) animationConfiguration;


  ///
  /// This is the parent of all views and child of the all screens
  ///
  /// It encapsulates the animation setup and giving the [AnimationController]
  /// to the user by calling back its [animationConfiguration]
  /// * It is a ui setup and does not hold any functionality directly
  const MainLayout({
    Key? key,
    required this.child,
    required this.animationConfiguration,
  }) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  late final Animation _animation;
  late final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KittyAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Background(animation: _animation),
            Center(
              child: Opacity(
                opacity: .1,
                child: Image.asset(LinkResources.assetImage),
              ),
            ),
            Center(child: widget.child),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _setupAnimationController();
    _setupAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //helper methods for animation configurations
  void _setupAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: AnimationUtil.shortPeriod,
    );
    widget.animationConfiguration(_animationController);
  }

  void _setupAnimation() {
    _animation = Tween<double>(begin: 2, end: .1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutExpo,
        reverseCurve: Curves.easeInExpo))
      ..addListener(() {
        setState(() {});
      });
  }
}
