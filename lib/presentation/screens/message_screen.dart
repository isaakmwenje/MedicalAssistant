import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';
import '../widgets/message/message_box.dart';
import '../widgets/reusable_widgets/big_text.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:[
          Positioned(
            top:0,
            left:0,
            bottom:0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height:Dimensions.height10*17,
              width:double.infinity,
              decoration:BoxDecoration(
                color:Colors.blue,
              ),
              child: Column(
                mainAxisSize:MainAxisSize.max,
                children: [
                  SizedBox(height:70),
                  Row(
                        children: [
                          SizedBox(width:Dimensions.width12*10),
                          BigText(text:'Messages',color:Colors.white,size:22),
                          SizedBox(width:Dimensions.width12*9),
                          Icon(Icons.more_horiz_outlined,color:Colors.white,size:24),
                        ],
                      ),
                ],
              ),
            ),
          ),
          Positioned(
            top:Dimensions.height120,
            left:0,
            right:0,
            bottom:0,
            child:Container(
              decoration:BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color:Colors.white,
              ),
              child:Column(
                children:[
                  Container(
                    width:Dimensions.width100*3-Dimensions.width10*2,
                    margin:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12,right:Dimensions.width12),
                    alignment: Alignment.center,
                    height:Dimensions.height40,
                    child: TextField(
                      controller:textController,
                      decoration: InputDecoration(
                        suffixIcon:Icon(Icons.search),
                        hintText:'Search Messages...',
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color:Colors.black12,
                              width:1.0,
                            )
                        ),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(
                              color:Colors.black12,
                              width:1.0,
                            )
                        ),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height6*4),
                  Expanded(child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount:4,
                    itemBuilder: (BuildContext context, int index) {
                      return MessageBox();
                    },))
                ]
              )
            )
          )
        ]
      )
    );
  }
}

