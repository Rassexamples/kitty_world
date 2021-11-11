import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/resources/text_resources.dart';
import 'package:kitty_world/ui/shared_elements/button.dart';
import 'package:kitty_world/ui/shared_elements/main_layout.dart';

class ErrorView extends StatelessWidget {
  final String error;

  const ErrorView({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error),
            KittyButton(
              content: TextResource.errorScreenButton,
              onTap: () => SystemNavigator.pop(),
              color: AppTheme.colorPinkLow,
              textColor: Colors.white,
            )
          ],
        ),
      ),
      animationConfiguration: (animationController) =>
          {animationController.forward()},
    );
  }
}
