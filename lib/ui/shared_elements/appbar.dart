
import 'package:flutter/material.dart';
import 'package:kitty_world/resources/general_theme.dart';

class KittyAppBar extends AppBar {
  KittyAppBar({Key? key})
      : super(
    key: key,
    backgroundColor: AppTheme.generalTheme.primaryColor,
    title: const Text("Kitty world",style: AppTheme.textStyleLarge21,),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(12),
      ),
    ),
  );
}
