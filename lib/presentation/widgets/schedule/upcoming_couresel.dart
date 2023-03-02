import 'package:flutter/material.dart';
import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';

import '../reusable_widgets/small_text.dart';
import 'buttons.dart';

class UpcomingCarousel extends StatelessWidget {
  int index;
   UpcomingCarousel({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          index<2 ?(index==0?Padding(
            padding:  EdgeInsets.only(left:Dimensions.width10,top:Dimensions.height10*2),
            child: BigText(text:'Nearest visit',size:18),
          ):Padding(
            padding:  EdgeInsets.only(left:Dimensions.width10,bottom:Dimensions.height10,top:Dimensions.height10),
            child: BigText(text:'Future visits',size:18),
          )):SizedBox.shrink(),
          Stack(
            children:[
              Container(
                margin:index==0? EdgeInsets.only(left:Dimensions.width10*2,top:Dimensions.width10*2,right:Dimensions.width10,bottom:Dimensions.width10):EdgeInsets.all(Dimensions.width10),
                padding:EdgeInsets.all(Dimensions.width10),
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black12,
                      blurRadius:7,
                      offset:Offset(1,1),
                    )
                  ]
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width:Dimensions.width10*11),
                        SmallText(text:'availble',color:Colors.green),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      children: [
                        SizedBox(width: Dimensions.width100),
                        BigText(text:'Dr Aman Rapnekshit',size:18),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: Dimensions.width100),
                        Expanded(child: SmallText(text:'Appointment reserved at Ramens Hospital',maxLines: 2,)),
                      ],
                    ),
                    SizedBox(height: Dimensions.height4*6),
                    Row(
                      children: [
                        Icon(Icons.calendar_month,color:Colors.grey),
                        SizedBox(width: Dimensions.width4,),
                        BigText(text:'Monday,Aug29',size:18),
                        SizedBox(width: Dimensions.width4*4,),
                        Icon(Icons.alarm,color: Colors.grey,),
                        SizedBox(width: Dimensions.width4,),
                        BigText(text:'10:00-11:00',size:18),
                      ],
                    ),
                    SizedBox(height:Dimensions.height10*2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        TextAppButton(boxColor: Colors.blue.shade50,text:'Cancel',),
                        TextAppButton(boxColor: Colors.blue,text:'Reschedule',textColor: Colors.white,)
                      ]
                    ),
                    SizedBox(height:Dimensions.height10),
                  ],
                )
              ),
              Positioned(
                left:index == 0?0:Dimensions.width10,
                top:index == 0?0:Dimensions.height10,
                child: Container(
                  margin: EdgeInsets.all(Dimensions.width10),
                  height:index == 0 ?Dimensions.height100 :Dimensions.height10*8,
                  width: index == 0?Dimensions.width100 : Dimensions.width10*8,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey,
                        blurRadius:index ==0?7:2,
                        offset:Offset(1,1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ]
          ),
        ],
      )
    );
  }
}
