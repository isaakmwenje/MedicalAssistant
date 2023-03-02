import 'package:flutter/material.dart';
import 'package:medical_assistant/presentation/widgets/home/select_appointment_type_box.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';
import 'appointment_box.dart';

class AppointmentType extends StatefulWidget {
  const AppointmentType({Key? key}) : super(key: key);

  @override
  State<AppointmentType> createState() => _AppointmentTypeState();
}

class _AppointmentTypeState extends State<AppointmentType> {
  String? selectedType;
  bool hospitalToggled = false;
  bool homeToggled = false;
  bool onlineToggled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:'step 1/4',color:Colors.blue),
        SizedBox(height:Dimensions.height10*4),
        BigText(text:'Choose Type of Doctor'),
        SizedBox(height:Dimensions.height10*2),
        Row(
          children: [
            GestureDetector(
              onTap:(){
                setState(() {
                  selectedType = 'General';
                });
              },
                child: AppointmentBox(text:'General',boxColor:selectedType == 'General'?Colors.blue:Colors.black12, textColor: selectedType == 'General'?Colors.white:(selectedType ==null?Colors.black:Colors.black12),)),
            SizedBox(width:Dimensions.width6*4),
            GestureDetector(
    onTap:(){
    setState(() {
    selectedType = 'Specialist';
    });
    },
              child: AppointmentBox(text:'Specialist',boxColor:selectedType == 'Specialist'?Colors.blue:Colors.black12,textColor:selectedType == 'Specialist'?Colors.white:(selectedType ==null?Colors.black:Colors.black12))),
          ],
        ),
        SizedBox(height:Dimensions.height10*2),
        BigText(text:'Appointment Type'),
        SizedBox(height:Dimensions.height10*2),
        ToggleBox(onChanged: (bool bool) {
          setState(() {
            hospitalToggled = bool;
            homeToggled = false;
            onlineToggled = false;
          });
        }, isToggled: hospitalToggled,text:'Hospital Visit',icon:Icons.local_pharmacy),
        SizedBox(height:Dimensions.height6),
        ToggleBox(onChanged: (bool bool) {
          setState(() {
            homeToggled = bool;
            hospitalToggled =false;
            onlineToggled = false;
          });
        }, isToggled: homeToggled,text:'Home Visit',icon: Icons.add_home_work_outlined,),
        SizedBox(height:Dimensions.height6),
        ToggleBox(onChanged: (bool bool) {
          setState(() {
            onlineToggled = bool;
            homeToggled = false;
            hospitalToggled =false;
          });
        }, isToggled: onlineToggled,icon:Icons.video_call_rounded,text:'Online'),
      ],
    );
  }
}
