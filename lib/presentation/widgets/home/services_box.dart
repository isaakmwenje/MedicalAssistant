import 'package:flutter/material.dart';
import 'package:medical_assistant/constants/dimensions.dart';

import '../reusable_widgets/small_text.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:EdgeInsets.only(left:Dimensions.width6),
        padding:EdgeInsets.all(Dimensions.width4),
      decoration: BoxDecoration(
        border:Border.all(color:Colors.green),
        borderRadius: BorderRadius.circular(4),
      ),
      child:Row(
        children:[
          Icon(Icons.alarm,color:Colors.yellow),
          SmallText(text:'|',color:Colors.green,size:22),
          SmallText(text:'Dental Care',color:Colors.green),
        ]

      )
    );
  }
}
