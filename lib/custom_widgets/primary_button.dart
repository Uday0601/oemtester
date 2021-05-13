import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final color;
  final textColor;
  final VoidCallback onPressed;
  final String text;

  PrimaryButton(
      {this.color, @required this.onPressed, this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      minWidth: double.infinity,
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}
