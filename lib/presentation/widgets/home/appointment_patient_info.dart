import 'package:flutter/material.dart';
import 'package:medical_assistant/presentation/widgets/home/services_box.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';

class AppointmentPatientInfo extends StatefulWidget {
  const AppointmentPatientInfo({Key? key}) : super(key: key);

  @override
  State<AppointmentPatientInfo> createState() => _AppointmentPatientInfoState();
}

class _AppointmentPatientInfoState extends State<AppointmentPatientInfo> {
  String? selectedGender;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  TextEditingController? textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:'step 2/4',color:Colors.blue),
        SizedBox(height:Dimensions.height10*4),
        BigText(text:'Add Patient Information'),
        SizedBox(height:Dimensions.height10*2),
        //add patient info
        Container(
          height: Dimensions.height10*4+Dimensions.height6,
            decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(8),
              border:Border.all(color:Colors.black12),
            ),
            child:TextField(
              controller:textController,
              decoration: InputDecoration(
                suffixIcon:Icon(Icons.edit),
                hintText:'Patient Name',
                focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color:Colors.white,
                      width:1.0,
                    )
                ),
                enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:const BorderSide(
                      color:Colors.white,
                      width:1.0,
                    )
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
        ),
        SizedBox(height:Dimensions.height10*2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              padding:EdgeInsets.symmetric(horizontal:8,vertical:8),
              decoration:BoxDecoration(
                color:Colors.grey[300],
                borderRadius:BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child:DropdownButton<String>(
                  isDense:true,
                  underline:null,
                  icon:const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
                  hint:BigText(text:'Gender',size:18),
                  value: selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  items: <String>['Male','Female','Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: BigText(text:value,size:18),
                    );
                  })
                      .toList(),
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.symmetric(horizontal:8,vertical:8),
              decoration:BoxDecoration(
                color:Colors.grey[300],
                borderRadius:BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  DropdownButtonHideUnderline(
                    child:DropdownButton<String>(
                      isDense:true,
                      underline:null,
                      icon:const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
                      hint:BigText(text:'dd',size:18),
                      value: selectedDay,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDay = newValue;
                        });
                      },
                      items: <String>['1','2','3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: BigText(text:value,size:18),
                        );
                      })
                          .toList(),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child:DropdownButton<String>(
                      isDense:true,
                      underline:null,
                      icon:const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
                      hint:BigText(text:'mm',size:18),
                      value: selectedMonth,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMonth = newValue;
                        });
                      },
                      items: <String>['1','2','3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: BigText(text:value,size:18),
                        );
                      })
                          .toList(),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child:DropdownButton<String>(
                      isDense:true,
                      underline:null,
                      icon:const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
                      hint:BigText(text:'yyyy',size:18),
                      value: selectedYear,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedYear = newValue;
                        });
                      },
                      items: <String>['2000','2001','2002']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: BigText(text:value,size:18),
                        );
                      })
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

          ]
        ),
        SizedBox(height:Dimensions.height10*2),
        BigText(text:'Select Symptoms'),
        SizedBox(height:Dimensions.height10*2),
        //select time
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
        BigText(text:'Add Note'),
        SizedBox(height:Dimensions.height10*2),
        Container(
            height: Dimensions.height100,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(8),
              border:Border.all(color:Colors.black12),
            ),
            child:TextField(
              controller:textController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(40),
                suffixIcon:Icon(Icons.edit),
                isDense:true,
                hintText:'Describe your cause of appointment!!',
                focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color:Colors.white,
                      width:1.0,
                    )
                ),
                enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:const BorderSide(
                      color:Colors.white,
                      width:1.0,
                    )
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
        ),
      ],
    );
  }
}
