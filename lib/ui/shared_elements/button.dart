
import 'package:flutter/material.dart';
import 'package:kitty_world/resources/general_theme.dart';

class KittyButton extends StatelessWidget {
  final String content;
  final Function() onTap;
  final Color color;
  final Color textColor;
  const KittyButton({
    Key? key,
    required this.content,
    required this.onTap,required this.color,required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: () => onTap(),
      child: Text(content,style: TextStyle(color: textColor),),
    );
  }
}
