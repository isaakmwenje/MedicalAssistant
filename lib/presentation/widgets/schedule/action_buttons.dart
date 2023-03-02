import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

class ActionButton extends StatelessWidget {
  Color boxColor;
  Color iconColor;
  IconData icon;
  ActionButton({Key? key,required this.boxColor,required this.iconColor,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top:Dimensions.width10*2,right:Dimensions.width10*2,bottom:Dimensions.width10),
        padding:EdgeInsets.all(Dimensions.width10),
        decoration: BoxDecoration(
            color:boxColor,
            borderRadius:BorderRadius.circular(16),
        ),
      child:Icon(icon,color:iconColor,size:24),
    );
  }
}
