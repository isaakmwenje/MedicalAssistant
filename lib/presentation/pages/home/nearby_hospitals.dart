import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/dimensions.dart';
import '../../widgets/home/services_box.dart';
import '../../widgets/reusable_widgets/big_text.dart';
import '../../widgets/reusable_widgets/expandable_widget_paragraphs.dart';
import '../../widgets/reusable_widgets/small_text.dart';
import '../../widgets/schedule/action_buttons.dart';
import 'appointment_page.dart';

class HospitalPage extends StatefulWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child:ListView(
            padding:EdgeInsets.symmetric(horizontal:Dimensions.width12),
          children:[
            Container(
              padding: EdgeInsets.all(Dimensions.width4),
              decoration: BoxDecoration(
                color:Colors.white,
                border: Border.all(color:Colors.black12),
                borderRadius:BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Stack(
                    children: [
                      Container(
                        height:180,
                        width:120,
                        decoration: BoxDecoration(
                          color:Colors.yellow,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child:Icon(Icons.arrow_back,size:28),)
                    ],
                  ),
                  SizedBox(width:Dimensions.width10*2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width:Dimensions.width100+Dimensions.width40,
                          child: BigText(text:'St Joseph Hospital ',size:28)),
                      SizedBox(
                          width:Dimensions.width100+Dimensions.width10*6,
                          child: SmallText(text:'General purpose hospital',)),
                      SizedBox(height:Dimensions.height10*2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            ActionButton(icon:Icons.call,iconColor:Colors.red.shade400,boxColor: Colors.red.shade100,),
                            ActionButton(icon:Icons.mail,iconColor:Colors.orange.shade400,boxColor: Colors.red.shade100,),
                            ActionButton(icon:Icons.location_on,iconColor:Colors.blue.shade400,boxColor: Colors.green.shade100,),
                          ]
                      ),
                    ],
                  ),
                ]
              ),
            ),
            SizedBox(height:Dimensions.height10*4),
            BigText(
              text:'About',),
            SizedBox(height:Dimensions.height10),
            ExpandedParagraph(
                text: 'Discover 0 Hospital App For Android designs on Dribbble. ... #2 Medical MobileApp android app application dashboard design doctor healtcare health hospital'
            ),
            SizedBox(height:Dimensions.height10*3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text:'Reviews',),
                SmallText(
                  text:'See all',color:Colors.blue,
                )
              ],

            ),
            SizedBox(height:Dimensions.height10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(),
                SizedBox(width:Dimensions.width12),
                SizedBox(
                  width:300,
                  child: Column(
                    children: [
                      ExpandedParagraph(
                          text: 'Discover 0 Hospital App For Android designs on Dribbble. ... #2 Medical MobileApp android app application dashboard design doctor healtcare health hospital'
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height:Dimensions.height10*2),
            BigText(text:'Services offered'),
            SizedBox(height:Dimensions.height10),
            SizedBox(
                height:Dimensions.height10*4,
                child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:4,
                  itemBuilder: (context,index){
                    return ServiceBox();
                  },
                )
            ),
            SizedBox(height:Dimensions.height10*2),
            SizedBox(
                height:Dimensions.height10*4,
                child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:4,
                  itemBuilder: (context,index){
                    return ServiceBox();
                  },
                )
            ),
            SizedBox(height:Dimensions.height10*2),
          ]
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap:(){
          Get.to(()=>AppointmentPage());
        },
        child: Container(
          alignment: Alignment.center,
          height:Dimensions.height10*4,
          margin:EdgeInsets.only(left:Dimensions.width12,right:Dimensions.width12,bottom:Dimensions.height10),
          color:Colors.blue,
          child:BigText(text:'Make Appointment',color:Colors.white)
        ),
      ),
    );
  }
}
