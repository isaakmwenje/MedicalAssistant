
import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';
class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal:Dimensions.width6,vertical: Dimensions.width6),
      padding:EdgeInsets.all(Dimensions.width6),
      decoration:BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const[
          BoxShadow(
            offset: Offset(1,1),
            color:Colors.black12,
            blurRadius: 6,
          )
        ]
      ),
      child :Row(
        children:[
          Container(
            margin: EdgeInsets.all(Dimensions.width10),
            height:Dimensions.height10*7,
            width:  Dimensions.width10*7,
            decoration: BoxDecoration(
              color:Colors.white,
              boxShadow: const [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius:2,
                  offset:Offset(1,1),
                )
              ],
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text:"Dr Krishna Patel"),
                  SizedBox(width:Dimensions.width10*8),
                  CircleAvatar(
                      radius:12,
                      child:BigText(text:'1',color:Colors.white)),
                ],
              ),
              SizedBox(height:Dimensions.height4*2),
              Row(
                children: [
                  SizedBox(
                      width:Dimensions.width100*2,
                      child: SmallText(text:'Your appointment was received thank you. Visit again',maxLines: 1,)),
                  Icon(Icons.check,size:18),
                ],
              )
            ]
          )
        ]
      )
    );
  }
}
