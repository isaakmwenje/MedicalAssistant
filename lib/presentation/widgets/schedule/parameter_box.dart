import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';

class ParameterBox extends StatelessWidget {
  String parameter;
  String parameterValue;
  String parameterUnit;
  ParameterBox({Key? key,required this.parameter,required this.parameterUnit,required this.parameterValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left:Dimensions.width10*2,right:Dimensions.width10*3),
      padding:EdgeInsets.only(left:Dimensions.width6,right:Dimensions.width6*2,bottom:Dimensions.height6*2,top:Dimensions.height6*2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:Colors.white,
        boxShadow:[
          BoxShadow(
            color:Colors.black12,
            spreadRadius:1,
            blurRadius:2,
            offset: Offset(1,1)
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            height:Dimensions.height10*4,
            width:Dimensions.width10*4,
            decoration:BoxDecoration(
              color:Colors.yellow,
              borderRadius:BorderRadius.circular(12),
              border:Border.all(color:Colors.black12,width:1.4),
            ),
          ),
          SizedBox(width:Dimensions.width6*3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text:parameter),
                Row(children: [
                  SmallText(text:parameterValue),
                  SizedBox(width:Dimensions.width4),
                  SmallText(text:parameterUnit,size:14)
                ],),
              ]
          ),
        ],
      ),
    );
  }
}
