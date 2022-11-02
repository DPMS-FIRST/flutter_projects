import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key ,required this.text,this.backgroundcolor,required this.onTap});
   final String text;
  final Color? backgroundcolor;
   final Function onTap; 


  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap:onTap() ,
      child: Container(

          height: 50,
          width: 326,
          color: backgroundcolor,
          child: Text(text),
       padding: EdgeInsets.symmetric(horizontal: 10.0),
       margin: EdgeInsets.symmetric(vertical: 10.0
       ),
      ),
    );
  }
}
