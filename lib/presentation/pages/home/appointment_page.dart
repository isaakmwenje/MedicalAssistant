import 'package:flutter/material.dart';
import 'package:medical_assistant/main.dart';

import '../../../constants/dimensions.dart';
import '../../widgets/home/appointment_patient_info.dart';
import '../../widgets/home/appointment_payment.dart';
import '../../widgets/home/appointment_schedule.dart';
import '../../widgets/home/appointment_type.dart';
import '../../widgets/reusable_widgets/big_text.dart';



class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<Widget> _schedulePages = [
     AppointmentType(),
     AppointmentPatientInfo(),
    AppointmentSchedule(),
    AppointmentPayment(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        body:SafeArea(
          child: ListView(
              padding:  EdgeInsets.symmetric(horizontal:Dimensions.width12)  ,
            children: [
              SizedBox(height:Dimensions.height6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(icon:Icon(Icons.arrow_back,size:28),onPressed: (){
                    Navigator.of(context).pop();
                  },),
                ],
              ),
              BigText(text:'Make Appointment',size:22),
              Expanded(
                child: Stack(
                    children:_schedulePages.asMap().map((i,screen) =>MapEntry(
                        i,Offstage(
                      offstage:selectedIndex !=  i,
                      child:screen,
                    )
                    )).values.toList()
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap:(){
            setState(() {
              selectedIndex = selectedIndex+1;
              if(selectedIndex >= 3){
                selectedIndex = 3;
              }
            });
    },
      child: Container(
          alignment: Alignment.center,
          height:Dimensions.height10*4,
          margin:EdgeInsets.only(left:Dimensions.width12,right:Dimensions.width12,bottom:Dimensions.height10),
          color:Colors.blue,
          child:BigText(text:selectedIndex < 3 ?'Continue':'Confirm',color:Colors.white)
      ),
    ),
      ),
    );
  }
}

