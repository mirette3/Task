import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.title,
      required this.onPressed,
      required this.textColor,
      required this.bgColor});

  final String title;
  final Color textColor;
  final Color bgColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            backgroundColor: bgColor,
            padding: EdgeInsets.all(20),
            side: BorderSide(color: Colors.lightGreen, width: 3),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 5),
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
