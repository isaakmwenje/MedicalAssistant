import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import '../../../controllers/data_uploader.dart';
import '../../../controllers/outh_controller.dart';
import '../../../data/models/appointment_model.dart';
import '../../nav_bar.dart';
import '../../widgets/reusable_widgets/show_custom_snackBar.dart';


class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  String? selectedProvince ;
  String? selectedTown ;
  String? selectedMedicalCenter;
  DateTime? _selectedDate ;
  String? selectedTiming;
  bool? isSelected;

  List<String> timings = [ '9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00',"17:00"];
  @override
  Widget build(BuildContext context) {

    bookAppointment(){


      if(selectedProvince == null){
        showCustomSnackBar('select a familiar region',title: 'Appointment');
      }if(selectedTown == null){
        showCustomSnackBar('Select a familiar town',title: 'Appointment');
      }else if(selectedMedicalCenter == null){
        showCustomSnackBar('Select a familiar Medical Centre',title:'Appointment');
      }else if(_selectedDate==null){
        showCustomSnackBar('Select day and month',title:'Appointment');
      }else if(selectedTiming==null){
      showCustomSnackBar('Select time of day',title:'Appointment');
      }else{
        AppointmentModel appointmentModel = AppointmentModel(region:selectedProvince,town:selectedTown,hospital:selectedMedicalCenter,time:selectedTiming,dateTime: _selectedDate,uid: OuthController.instance.uid!);
        DataUploader.instance.uploadData(appointmentModel);
        Get.back();
      }
    }
    return Scaffold(
        backgroundColor:Colors.white,
      body:SafeArea(
          child:ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height:30),
                //get back button
                Container(
                  width:double.infinity,
                  alignment:Alignment.topLeft,
                  child: IconButton(
                    onPressed:(){
                      Get.back();
                    },
                    icon:Icon(Icons.arrow_back,color:Colors.blue)
                  ),
                ),
                //select place
                Container(
                  width:double.infinity,
                  margin:const EdgeInsets.symmetric(horizontal:12.0,),
                  decoration:BoxDecoration(
                      color:Colors.white,
                    border:Border.all(
                      color:Colors.grey[400]!,
                    )
                  ),
                  child:Column(
                    children:[
                      //select region
                      Container(
                        width:double.infinity,
                        height:60,
                        color:Colors.white,
                        margin:const EdgeInsets.only(top:20,bottom:10.0,left:10.0,right: 10.0),
                        child: DropdownButtonFormField<String>(
                          value:selectedProvince,
                          onChanged: (item){
                            selectedProvince=item!;
                          },
                          decoration: InputDecoration(
                              hintText:'Select Province',
                              prefixIcon: Icon(Icons.location_on_sharp,color:Colors.blue),
                              enabledBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                    color:Colors.grey[400]!,
                                    width:1.5,
                                  )
                              ),
                              focusedBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(4),
                                  borderSide:BorderSide(
                                    color:Colors.grey[400]!,
                                    width:1.4,
                                  )
                              )
                          ),
                          items:['apple','PPP health Center','Waridi Hospital'].map((item){
                            return DropdownMenuItem<String>(
                                value:item,
                                child:Text(item));
                          }).toList(),
                        ),
                      ),
                      //select town
                      Container(
                          width:double.infinity,
                        height:60,
                        color:Colors.white,
                        margin:const EdgeInsets.only(bottom:10.0,left:10.0,right: 10.0),
                        child: DropdownButtonFormField<String>(
                          value:selectedTown,
                          onChanged: (item){
                            selectedTown=item!;
                          },
                          decoration: InputDecoration(
                              hintText:'Select Town',
                              prefixIcon: Icon(Icons.location_city,color:Colors.blue),
                              enabledBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                    color:Colors.grey[400]!,
                                    width:1.5,
                                  )
                              ),
                              focusedBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(4),
                                  borderSide:BorderSide(
                                    color:Colors.grey[400]!,
                                    width:1.4,
                                  )
                              )
                          ),
                          items:['Abu dhambi','Masijal','Besa'].map((item){
                            return DropdownMenuItem<String>(
                                value:item,
                                child:Text(item));
                          }).toList(),
                        ),
                      ),
                      //select hospital
                      Container(
                          width:double.infinity,
                        height:60,
                        color:Colors.white,
                        margin:const EdgeInsets.only(bottom:10.0,left:10.0,right: 10.0),
                        child: DropdownButtonFormField<String>(
                          value:selectedMedicalCenter,
                          onChanged: (item){
                            selectedMedicalCenter=item!;
                          },
                          decoration: InputDecoration(
                              hintText:'Select Health Centre',
                              prefixIcon: Icon(Icons.local_hospital_outlined,color:Colors.blue),
                              enabledBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                    color:Colors.grey[400]!,
                                    width:1.5,
                                  )
                              ),
                              focusedBorder:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(4),
                                  borderSide:BorderSide(
                                    color:Colors.grey[400]!,
                                    width:1.4,
                                  )
                              )
                          ),
                          items:['KKK+ Hospital','PPP Health Center','Waridi Hospital'].map((item){
                            return DropdownMenuItem<String>(
                                value:item,
                                child:Text(item));
                          }).toList(),
                        ),
                      ),
                    ]
                  )
                ),
                SizedBox(height:30),
                Divider(height:1.0),
                //select date
                Padding(
              padding: const EdgeInsets.only(top:0,left:20),
              child: Text(
                  'Select Date',
                  style:TextStyle(
                    color:Colors.blueGrey[700],
                    fontSize:22,
                    fontWeight:FontWeight.w500,
                    letterSpacing: 1.2,
                  )
              )),
                //pick date
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DatePicker(
                    height:84,
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
                ),
                Divider(height:1.0),
                SizedBox(height:30),
                Divider(height:1.0),
                //available timings
                Padding(
                  padding: const EdgeInsets.only(top:0,left:20),
                  child: Text(
                      'Available Timings',
                      style:TextStyle(
                        color:Colors.blueGrey[700],
                        fontSize:22,
                        fontWeight:FontWeight.w500,
                        letterSpacing: 1.2,
                      )
                  ),
                ),
                //select time
                SizedBox(
                  height:52,
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
                          margin:EdgeInsets.only(top:20,left:12,right:12),
                          alignment: Alignment.center,
                          width:100,
                           height:2,
                          decoration:BoxDecoration(
                            color:selectedTiming == timings[index]?Colors.blue:Colors.grey[200],
                            borderRadius:BorderRadius.circular(6),
                          ),
                          child:Text(
                            timings[index],
                            style:const TextStyle(
                              fontSize:22,
                            )
                          )
                        ),
                      );
                    },
                  )
                ),
                SizedBox(
                    height:52,
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
                              margin:const EdgeInsets.only(top:20,left:12,right:12),
                              alignment: Alignment.center,
                              width:130,
                              height:2,
                              decoration:BoxDecoration(
                                  color:selectedTiming == timings[index+4]?Colors.blue:Colors.grey[200],
                                  borderRadius:BorderRadius.circular(6)
                              ),
                              child: Text(
                                  timings[index+4],
                                  style:const TextStyle(
                                    fontSize:22,
                                  )
                              )
                          ),
                        );
                      },
                    )
                ),
                SizedBox(height:10),
                Divider(height:1.0),
                SizedBox(height:10),
                //book appointment
                GestureDetector(
                  onTap:(){
                    bookAppointment();
                  },
                  child:Container(
                      height:50,
                      alignment:Alignment.center,
                      margin:const EdgeInsets.symmetric(horizontal:60,vertical:10),
                      decoration: BoxDecoration(
                        color:Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:const  Text(
                          'Book Appointment',
                          style:TextStyle(
                            fontSize:24,
                            fontWeight: FontWeight.w400,
                            color:Colors.black,
                          )
                      )
                  )
                )
            ]
          )
        ),
    );
  }
}
