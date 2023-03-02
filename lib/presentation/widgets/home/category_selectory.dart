import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/small_text.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12),
      padding:EdgeInsets.only(left:Dimensions.width6,right:Dimensions.width6*2,bottom:Dimensions.height6,),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(12.0),
        border:Border.all(color:Colors.black12,width:1.0),
      ),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
            Container(
              height:Dimensions.height10*5,
              width:Dimensions.width10*5,
              decoration:BoxDecoration(
                color:Colors.yellow,
                borderRadius:BorderRadius.circular(12),
                border:Border.all(color:Colors.black12,width:1.4),
            ),
            ),
          SizedBox(width:Dimensions.width10*2),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              SmallText(text:'Dentistry',size:16,color:Colors.black),
              SizedBox(height:Dimensions.height4/2),
              SmallText(text:'Check up',size:16,color:Colors.black)
            ],
          ),
        ]
      )
    );
  }
}
