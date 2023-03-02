import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';

class ExploreDoctorBox extends StatelessWidget {
  int index;
  ExploreDoctorBox({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width:Dimensions.width10*11,
        padding:EdgeInsets.only(left:Dimensions.width4*4-Dimensions.width4/2,top:Dimensions.height10),
        margin:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12),
        decoration: BoxDecoration(
         color:index == 0?Colors.blue.shade100: Colors.white,
         borderRadius:BorderRadius.circular(8.0),
       ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(
            children: [
              SizedBox(width:Dimensions.width4*3),
              CircleAvatar(
                 radius:28,
              ),
            ],
          ),
          SizedBox(height:Dimensions.height4),
          BigText(text:'Dr Akhan'),
          SmallText(text:'Neurologist',size:14),
          SizedBox(height:Dimensions.height10),
          Row(
              children:[
                SizedBox(width:Dimensions.width4*3),
                BigText(text:'4.3'),
                Icon(Icons.star,color:Colors.yellow,size:20),
              ]
          )

        ]
      )
    );
  }
}
