import 'package:flutter/material.dart';
import 'package:medical_assistant/presentation/widgets/home/services_box.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';

class AppointmentPayment extends StatefulWidget {
  const AppointmentPayment({Key? key}) : super(key: key);

  @override
  State<AppointmentPayment> createState() => _AppointmentPaymentState();
}

class _AppointmentPaymentState extends State<AppointmentPayment> {

  TextEditingController? textController = TextEditingController();
  bool selectedCard = false;
  bool selectedInsurance = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:'step 4/4',color:Colors.blue),
        SizedBox(height:Dimensions.height10*4),
        Row(
          children: [
            GestureDetector(
              onTap:(){
                setState(() {
                  selectedCard = true;
                  selectedInsurance = false;
                });
              },
              child: CircleAvatar(
                radius:14,
                backgroundColor:Colors.white,
                child:CircleAvatar(
                  radius:6,
                  backgroundColor: !selectedCard?Colors.black12:Colors.blue,
                )
              ),
            ),
            SizedBox(width:Dimensions.width10*3),
            BigText(text:'Payment by Card'),
          ],
        ),
        SizedBox(height:Dimensions.height10*12),
        Row(
          children: [
            GestureDetector(
              onTap:(){
                setState(() {
                  selectedInsurance = true;
                  selectedCard = false;
                });
              },
              child: CircleAvatar(
                  radius:14,
                  backgroundColor:Colors.white,
                  child:CircleAvatar(
                    radius:6,
                    backgroundColor: !selectedInsurance?Colors.black12:Colors.blue,
                  )
              ),
            ),
            SizedBox(width:Dimensions.width10*3),
            BigText(text:'Insurance'),
          ],
        ),
        SizedBox(height:Dimensions.height10*2),
        //add patient info

        SizedBox(height:Dimensions.height10*2),
        //select time
    ]
    );
  }
}
