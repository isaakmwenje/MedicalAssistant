
import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

class AppTextField extends StatelessWidget {
  IconData icon;
  String text;
  bool isObscure;
 TextEditingController textController;
  AppTextField({Key? key,this.isObscure = false,required this.icon,required this.text,required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top:Dimensions.height10*2,left: Dimensions.width6,right: Dimensions.width6),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius:BorderRadius.circular(20),
        boxShadow:[
          BoxShadow(
            color:Colors.black.withOpacity(0.2),
            offset:const Offset(1,1),
            blurRadius:1,
            spreadRadius: 1,
          )
        ]
      ),
      child:TextField(
        obscureText: isObscure,
       controller:textController,
        decoration: InputDecoration(
          hintText:text,
          prefixIcon:Icon(icon,color:Colors.lightBlue[200]),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color:Colors.white,
              width:1.0,
            )
          ),
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:const BorderSide(
                color:Colors.white,
                width:1.0,
              )
          ),
          border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
          ),
        ),
      )
    );
  }
}
