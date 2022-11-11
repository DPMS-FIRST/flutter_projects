import 'package:flutter/material.dart';

class textButton extends StatelessWidget {
  const textButton({super.key, required this.text, this.backgroundcolor});
  final String text;
  final Color? backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 50,
        width: 326,
        decoration: BoxDecoration(
          color: backgroundcolor ?? Colors.blueGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Poppins"),
          ),
        ),
      ),
    );
  }
}
