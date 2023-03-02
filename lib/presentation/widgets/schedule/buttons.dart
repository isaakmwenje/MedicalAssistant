import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';

class TextAppButton extends StatelessWidget {
  Color boxColor;
  Color? textColor;
  String text;
  TextAppButton({Key? key,required this.boxColor,required this.text,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width6*6,vertical: Dimensions.width6*2),
      decoration: BoxDecoration(
        color:boxColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child:BigText(text:text,size:18,color:textColor??Colors.black),
    );
  }
}
