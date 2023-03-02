import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';
import '../reusable_widgets/small_text.dart';

class AppointmentSchedule extends StatefulWidget {
  const AppointmentSchedule({Key? key}) : super(key: key);

  @override
  State<AppointmentSchedule> createState() => _AppointmentScheduleState();
}

class _AppointmentScheduleState extends State<AppointmentSchedule> {
  DateTime? _selectedDate ;
  String? selectedTiming;
  bool? isSelected;
  List<String> timings = [ '9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00',"17:00"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:'step 3/4',color:Colors.blue),
        SizedBox(height:Dimensions.height10*4),
        BigText(text:'Select Date'),
        SizedBox(height:Dimensions.height10*2),
        //pick date
        DatePicker(
          height:Dimensions.height10*8,
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          deactivatedColor: Colors.grey[500]!,
          selectionColor:Colors.blue,
          selectedTextColor: Colors.black,
          onDateChange: (date) {
            // New date selected
            setState(() {
              _selectedDate = date;
            });
          },
        ),
        SizedBox(height:Dimensions.height10*2),
        BigText(text:'Available Slots'),
        SizedBox(height:Dimensions.height10),
        //select time
        SizedBox(
            height:Dimensions.height10*5,
            child:ListView.builder(
              itemCount:4,
              scrollDirection:Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:(){
                    setState((){
                      selectedTiming = timings[index];
                    });
                  },
                  child: Container(
                      margin:EdgeInsets.only(top:Dimensions.height10,right:Dimensions.width12),
                      alignment: Alignment.center,
                      width:100,
                      height:2,
                      decoration:BoxDecoration(
                        color:selectedTiming == timings[index]?Colors.blue:Colors.white,
                        borderRadius:BorderRadius.circular(6),
                      ),
                      child:SmallText(text:timings[index]),
                  ),
                );
              },
            )
        ),
        SizedBox(
            height:Dimensions.height10*5,
            child:ListView.builder(
              itemCount:5,
              scrollDirection:Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:(){
                    setState((){
                      selectedTiming = timings[index+4];
                    });
                  },
                  child: Container(
                      margin:EdgeInsets.only(top:Dimensions.height10,right:Dimensions.width12),
                      alignment: Alignment.center,
                      width:100,
                      height:2,
                      decoration:BoxDecoration(
                          color:selectedTiming == timings[index+4]?Colors.blue:Colors.white,
                          borderRadius:BorderRadius.circular(6),
                      ),
                      child: SmallText(text:timings[index+4],)
                  ),
                );
              },
            )
        ),
      ],
    );
  }
}
