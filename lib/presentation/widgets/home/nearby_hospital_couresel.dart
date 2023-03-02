import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';

class HospitalCouresel extends StatelessWidget {
  final Color color;
  const HospitalCouresel({Key? key,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(left:Dimensions.width10,top:Dimensions.height10),
      margin:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12),
      height:Dimensions.height10*17,
      width:Dimensions.height10*15,
     decoration: BoxDecoration(
       color:color,
       borderRadius:BorderRadius.circular(12),
     ),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:AssetImage('assets/hospital.png'),
            ),
            SizedBox(width:Dimensions.width10),
            SmallText(text:'Open 24 hrs',size:16,color:Colors.black),
          ],
        ),
        SizedBox(height:  Dimensions.height10,),
        BigText(text:'St Joseph  hospital'),
        SmallText(text:'private',color:Colors.black),
        SizedBox(height:  Dimensions.height10,),
        // Row(
        //   children:[
        //   Icon(Icons.call_outlined,color:Colors.black),
        //     SizedBox(width:Dimensions.width10+Dimensions.width6),
        //     SmallText(text:'0712345678',size:18,color:Colors.blue),
        //   ],
        // )
      ],
    )
    );
  }
}
