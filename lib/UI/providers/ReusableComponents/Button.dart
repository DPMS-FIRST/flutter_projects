import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {

  const ReusableButton({super.key, required this.text, required this.onPressed});
  final String text;
   final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
            onPressed: this.onPressed!,
            child: Text(text)
            ),
        ),
      ],
    );
  }
}