import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({super.key, this.hintext, this.prefixicon, this.controller});
  final hintext;
  final prefixicon;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintext,
              prefixIcon: prefixicon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
