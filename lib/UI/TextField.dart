import 'package:first_app/HintText/hint_text.dart';
import 'package:first_app/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';



class TextFieldDesign extends StatefulWidget {
  const TextFieldDesign({super.key});

  @override
  State<TextFieldDesign> createState() => _TextFieldDesignState();
}

class _TextFieldDesignState extends State<TextFieldDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: AppColorSelect.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  hintText: AppHintText.email,
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    fontFamily: "poppins",
                    color: AppColorSelect.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            margin: EdgeInsets.symmetric(vertical: 12.0),
          ),

        
        ],
      ),
    );
  }
}

/*
TextField 
prefixicon
hintText
validation
controller
isSecuretext




 */