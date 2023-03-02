import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/small_text.dart';

class ToggleBox extends StatelessWidget {
  String text;
  IconData icon;
  bool isToggled;
  Function(bool bool) onChanged;
      ToggleBox({Key? key,required this.onChanged,required this.isToggled,required this.icon,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child:Icon(icon,color:Colors.white70),
            ),
            SizedBox(width:Dimensions.width10*3),
            SmallText(text:text),
          ],
        ),
        Switch(
          onChanged: onChanged,
          value: isToggled,
          activeColor: Colors.blue,
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.black12,
        )
      ],
    );
  }
}

