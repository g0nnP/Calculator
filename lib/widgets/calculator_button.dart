import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.color,
    this.textColor = Colors.black
  }) : super(key: key);

  final String buttonText;
  final void Function() onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextButton(
        onPressed: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Text(buttonText, style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500
            ),)
          ),
        )
      ),
    );
  }
}