import 'package:flutter/material.dart';
class SignUpButton extends StatelessWidget {
  String text;
  SignUpButton({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       alignment: Alignment.center,
       width:140,
        height:32,
        margin:EdgeInsets.only(bottom:10),
        padding:EdgeInsets.symmetric(horizontal:12,vertical:4),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:Colors.blue,
        ),
        child:Text(
          text,
          style:const TextStyle(
            fontSize : 22,
            color:Colors.white,
          )
        )
    );
  }
}
