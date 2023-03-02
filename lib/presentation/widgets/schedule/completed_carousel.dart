import 'package:flutter/material.dart';
import 'package:medical_assistant/presentation/widgets/schedule/parameter_box.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';

class  CompletedCarousel extends StatelessWidget {
  int index;
  CompletedCarousel({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(Dimensions.width6),
      child: Stack(
        children: [
          Container(
            margin:EdgeInsets.all(Dimensions.width6),
            padding:EdgeInsets.all(Dimensions.width10),
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SmallText(text:'Therapeutical',size:16),
                Row(children:[
                  Icon(Icons.alarm,color:Colors.grey,size:18),
                  SizedBox(width:Dimensions.width4),
                  BigText(text:'Wed May29',size:16),
                  SizedBox(width:Dimensions.width4),
                  Icon(Icons.circle,size:8,),
                  SizedBox(width:Dimensions.width4),
                  BigText(text:'10:00-11:00',size:16)
                ]),
                SizedBox(height:Dimensions.height6*2),
                ParameterBox(parameter: 'Blood pressure',parameterUnit: 'mmHg',parameterValue: '141/90',),
                SizedBox(height:Dimensions.height4*2),
                ParameterBox(parameter: 'Blood glucose',parameterUnit: 'mgdl',parameterValue: '80-130',),
                SizedBox(height:Dimensions.height6*3),
              ]),
          ),
          Positioned(
            top:56,
            left:20,
            child:Container(
              height:170,
              width:4,
              decoration: BoxDecoration(
                color:Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
