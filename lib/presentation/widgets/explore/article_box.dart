import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';

class ArticleBox extends StatelessWidget {
  String title;
  String description;


  ArticleBox(
      {Key? key,required this.title,required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:Dimensions.height10*9,
      margin:EdgeInsets.only(left:Dimensions.width12,right:Dimensions.width12,bottom:Dimensions.height6*2),
      padding:EdgeInsets.only(left:Dimensions.width6,right:Dimensions.width6*2,top:Dimensions.height6*2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:Colors.white,
          boxShadow:[
            BoxShadow(
                color:Colors.black12,
                blurRadius:4,
                offset: Offset(1,1)
            )
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text:title),
                SizedBox(height:Dimensions.height6),
                SizedBox(
                  width:240,
                    child: SmallText(text:description,size:14,maxLines: 1,)),
              ]
          ),
          Icon(Icons.arrow_forward_ios,size:14,)
        ],
      ),
    );
  }
}
