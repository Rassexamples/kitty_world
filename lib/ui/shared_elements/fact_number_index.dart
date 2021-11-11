import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/util/extensions.dart';

class FactNumberIndex extends StatelessWidget {


  ///
  /// Floating -visually- number holder
  ///
  /// It randomly rotates and positions itself when attaching to the three
  const FactNumberIndex({
    Key? key,
    required this.positionOnList,
  }) : super(key: key);

  final int positionOnList;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "fact+$positionOnList",
      child: Material(
        color: Colors.transparent,
        child: Transform.rotate(
          angle: -pi/(RandomInRange.randomInRange(1, 4)*8),
          child: Container(
            padding:const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.colorPinkLowest,
            ),
            child: Text("#$positionOnList",style: GoogleFonts.metrophobic(fontSize: 18,color: Colors.black54),),
          ),
        ),
      ),
    );
  }
}