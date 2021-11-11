import 'package:flutter/material.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/ui/shared_elements/paints_and_paths/background_paint.dart';

class Background extends StatelessWidget {

  ///
  /// A wrapper for the curve lines [CustomPainter] and its [CustomPaint]
  const Background({
    Key? key,
    required Animation animation,
  }) : _animation = animation, super(key: key);

  final Animation _animation;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(
        mainColor: AppTheme.colorPinkLow,
        newOffset:
        Offset(_animation.value * 330, _animation.value * 80),
      ),
      child:  const SizedBox(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
