
import 'package:flutter/material.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/ui/shared_elements/main_layout.dart';

class LoadingView extends StatelessWidget {
  const LoadingView( {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Center(
        child: CircularProgressIndicator(
      color: AppTheme.colorPinkLow,
        ),
      ),
      animationConfiguration: (ac) => {ac.forward()},
    );
  }
}