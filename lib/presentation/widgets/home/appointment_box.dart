import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/small_text.dart';

class AppointmentBox extends StatelessWidget {
  String text;
  Color boxColor;
  Color textColor;
  AppointmentBox({Key? key,required this.text,required this.boxColor,required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:Dimensions.height4*2,horizontal:Dimensions.width4*3),
      decoration: BoxDecoration(
        color:boxColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child:SmallText(text:text,color:textColor)
    );
  }
}
