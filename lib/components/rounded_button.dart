import 'package:flutter/material.dart';
import '';
import '../app_data.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.child, required this.color, required this.onPressed, this.hasBorder = false});

  final Color color;
  final Widget child;
  final Function() onPressed;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: hasBorder ? Border.all(color: AppData.mainColor, width: 1.3) : null,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        // elevation: 2,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 56.0,
          child: child,
        ),
      ),
    );
  }
}
