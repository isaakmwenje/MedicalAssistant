

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medical_assistant/controllers/data_uploader.dart';

import '../../controllers/outh_controller.dart';
import '../pages/appointments/appointment,.dart';
import 'package:url_launcher/url_launcher.dart';
class MyHealthScreen extends StatefulWidget {
  const MyHealthScreen({Key? key}) : super(key: key);

  @override
  State<MyHealthScreen> createState() => _MyHealthScreenState();
}

class _MyHealthScreenState extends State<MyHealthScreen> {
  bool showMessageBox = false;
  bool showVideoCallBox = false;
  bool isAlert = false;
  DataUploader controller = Get.put(DataUploader());
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime dateTime){
      var  monthDay = DateFormat('d MMM').format(dateTime);
      //var  month = DateFormat('MMMM').format(dateTime);
      return '$monthDay ';
    }
    DataUploader.instance.getData();
    DataUploader.instance.getCheckUpData();
    return Scaffold(
      backgroundColor:Colors.grey[200],
      body:SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap:(){
                setState(() {
                  showMessageBox = false;
                  showVideoCallBox = false;
                });
              },
              child: ListView(
                children:[
                  //appointment
                  GestureDetector(
                    onTap:(){
                      setState(() {
                        num;
                      });
                      Get.to(()=>const Appointment());
                    },
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream:  FirebaseFirestore.instance.collection('hospital').doc('appointment').collection('appointments').where('uid',isEqualTo:OuthController.instance.uid).snapshots(),
                      builder: (context, snapshot) {
                        final docsLength = snapshot.data?.docs.length ?? 0;
                        return Container(
                          margin:EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          height:130,
                          width:double.infinity,
                          decoration:  BoxDecoration(
                            color:Colors.white,
                            borderRadius:BorderRadius.circular(20),
                          ),
                          child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize:MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 100,),
                                    const Text(
                                        'APPOINTMENTS',
                                        style:TextStyle(
                                          color:Colors.blueGrey,
                                          fontSize:22,
                                          letterSpacing:1.1,
                                        )
                                    ),
                                    Container(
                                        padding:EdgeInsets.symmetric(horizontal:12),
                                        decoration:BoxDecoration(
                                          color:CupertinoColors.systemBlue,
                                          borderRadius:BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                            docsLength.toString(),style:const TextStyle(
                                          color:Colors.white,
                                          fontSize:16,
                                        )
                                        )
                                    ),
                                  ],
                                ),
                                docsLength == 0?
                                Row(children: [
                                Stack(
                                children:[
                                const Image(
                                image: AssetImage('assets/no_appointment.png'),
                                height:100,
                                width:100,
                                ),
                                Positioned(
                                bottom:0,
                                child:Container(
                                color:Colors.white,
                                width:80,
                                height:30,
                                )
                                )
                                ]
                                ),
                                const Text(
                                'Schedule an appointment now',
                                style: TextStyle(
                                color:Colors.blueGrey,
                                fontSize:18,
                                ),
                                )
                                ]):
                                SizedBox(
                                  height:80,
                                  child:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                    stream:  FirebaseFirestore.instance.collection('hospital').doc('appointment').collection('appointments').where('uid',isEqualTo:OuthController.instance.uid).snapshots(),
                                    builder: (_, snapshot){
                                      if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                                      if(snapshot.hasData) {
                                        final docs = snapshot.data!.docs.reversed.toList();
                                        return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: docs.length,
                                            itemBuilder: (context, index) {
                                              final data = docs[index].data();
                                              return Container(
                                                padding: EdgeInsets.only(right: 10),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide( //                   <--- right side
                                                      color: Colors.blueGrey,
                                                      width: 3.0,
                                                    ),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        SizedBox(width: 70),
                                                         Text('day',
                                                            style: TextStyle(
                                                              color: Colors.blue,
                                                              fontSize: 18,
                                                            )),
                                                        SizedBox(width: 150),
                                                        Text('time',
                                                            style: TextStyle(
                                                              color: Colors.blue,
                                                              fontSize: 18,
                                                            ))
                                                      ],),
                                                    Row(
                                                      children: [
                                                        SizedBox(width: 4.0),
                                                        Icon(Icons.calendar_month,
                                                            color: Colors.blueGrey),
                                                        SizedBox(width: 30),
                                                        Text(formatDate(data['date_time'].toDate()),
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20,
                                                            )),
                                                        SizedBox(width: 130),
                                                        Text(data['time'],
                                                            style:const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20,
                                                            ))
                                                      ],),
                                                    Row(
                                                        children: [
                                                          SizedBox(width: 4.0),
                                                          const Icon(Icons.local_hospital,
                                                              color: Colors.blueGrey),
                                                          SizedBox(width: 30),
                                                          Text(data['hospital'],
                                                              style: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18,
                                                              )),
                                                        ]
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                        );
                                      }else {
                                      return const Center (child:CircularProgressIndicator ()
                                      );
                                    }
                                    }
                                  )
                                ),
                              ]
                          ),
                        );
                      }
                    )
                  ),
                  //check up
                  Container(
                      margin:EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      height:270,
                      width:double.infinity,
                      decoration:  BoxDecoration(
                        color:Colors.blue.shade500,
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize:MainAxisSize.max,
                              children: [
                                const Text(
                                    'CHECK UP',
                                    style:TextStyle(
                                      color:Colors.blueGrey,
                                      fontSize:22,
                                      letterSpacing:1.1,
                                    )
                                ),
                                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                    stream:  FirebaseFirestore.instance.collection('hospital').doc('patient_check_up').collection('patient_check_ups').where('email',isEqualTo:OuthController.instance.email).snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                                    if(snapshot.hasData){
                                      final doc = snapshot.data?.docs;
                                    return Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children:[
                                          Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:const [
                                                      Text(
                                                          'SYS',
                                                          style:TextStyle(
                                                            fontSize:22,
                                                          )
                                                      ),
                                                      Text(
                                                          'mmHg',
                                                          style:TextStyle(
                                                            fontSize:22,
                                                          )
                                                      )
                                                    ]
                                                ),
                                                SizedBox(width:60),
                                                Text(
                                                    doc!.isNotEmpty? snapshot.data!.docs[0].data()['sys']:'000' ,
                                                    style:TextStyle(
                                                      color:Colors.black,
                                                      fontSize:60,
                                                      fontWeight: FontWeight.w300,
                                                    )
                                                ),

                                              ]
                                          ),
                                        ]
                                    );}
                                    return Center(child:CircularProgressIndicator());
                                  }
                                ),
                                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                    stream:  FirebaseFirestore.instance.collection('hospital').doc('patient_check_up').collection('patient_check_ups').where('email',isEqualTo:OuthController.instance.uid).snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                                      if(snapshot.hasData){
                                        final doc = snapshot.data?.docs;
                                    return Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children:[
                                          Row(
                                              children: [
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:const [
                                                      Text(
                                                          'DIA',
                                                          style:TextStyle(
                                                            fontSize:22,
                                                          )
                                                      ),
                                                      Text(
                                                          'mmHg',
                                                          style:TextStyle(
                                                            fontSize:22,
                                                          )
                                                      )
                                                    ]
                                                ),
                                                SizedBox(width:60),
                                                Text(
                                                    doc!.isNotEmpty?snapshot.data!.docs[0].data()['dia']:'000',
                                                    style:TextStyle(
                                                      color:Colors.black,
                                                      fontSize:60,
                                                      fontWeight: FontWeight.w300,
                                                    )
                                                ),
                                                const SizedBox(width:0),
                                                const SizedBox(width:0),
                                              ]
                                          ),
                                        ]
                                    );}
                                     return const Center(child:CircularProgressIndicator());
                                  }
                                ),
                                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                    stream:  FirebaseFirestore.instance.collection('hospital').doc('appointment').collection('patient_check_ups').where('email',isEqualTo:OuthController.instance.email).snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                                     if(snapshot.hasData){
                                       final doc = snapshot.data?.docs;
                                    return Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children:[
                                          Row(
                                              children: [
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:const[
                                                      const SizedBox(width:20),
                                                      Text(
                                                          'PULSE',
                                                          style:TextStyle(
                                                            fontSize:22,
                                                          )
                                                      ),
                                                      Text(
                                                          'Beats/Min',
                                                          style:TextStyle(
                                                            fontSize:22,
                                                          )
                                                      )
                                                    ]
                                                ),
                                                SizedBox(width:60),
                                                Text(
                                                 doc!.isNotEmpty?snapshot.data!.docs[0].data()['dia']:'00',
                                                    style:const TextStyle(
                                                      color:Colors.black,
                                                      fontSize:60,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                ),
                                              ]
                                          ),
                                        ]
                                    );}
                                     return const Center(child:CircularProgressIndicator());
                                  }
                                ),
                              ]
                          ),
                  ),
                  //bills
                  Container(
                      margin:EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      height:160,
                      width:double.infinity,
                      decoration:  BoxDecoration(
                        color:Colors.blue.shade500,
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream:  FirebaseFirestore.instance.collection('hospital').doc('patient_bills').collection('patient_bills').where('email',isEqualTo:OuthController.instance.email).snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                          if(snapshot.hasData){
                            final doc = snapshot.data?.docs;
                            var total = 0;
                            if(doc!.isNotEmpty){
                               total  = snapshot.data!.docs[0].data()['testing_price'] + snapshot.data!.docs[0].data()['medical_charge']+ snapshot.data!.docs[0].data()['consultation_fee'];
                            }
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize:MainAxisSize.max,
                              children:[
                                const Text(
                                    'BILLS',
                                    style:TextStyle(
                                      color:Colors.blueGrey,
                                      fontSize:22,
                                      letterSpacing:1.1,
                                    )
                                ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   Text(
                                       "Consultation Fee",
                                       style:TextStyle(
                                         color:Colors.black,
                                         fontSize:22,
                                       )
                                   ),
                                   Text(
                                     doc!.isNotEmpty?"\$${snapshot.data!.docs[0].data()['consultation_fee']}":'\$0',
                                       style:TextStyle(
                                         color:Colors.black,
                                         fontSize:22,
                                       )
                                   ),
                                 ]
                               ),
                                Row(
                                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:[
                                      SizedBox(width:44.0),
                                      const Text(
                                          "Testing Pricing",
                                          style:TextStyle(
                                            color:Colors.black,
                                            fontSize:22,
                                          )
                                      ),
                                      const SizedBox(width:124.0),
                                      Text(
                                        doc.isNotEmpty?"\$${snapshot.data!.docs[0].data()['testing_price']}":'\$0',
                                          style:const TextStyle(
                                            color:Colors.black,
                                            fontSize:22,
                                          )
                                      ),
                                    ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          "Medicine Charge",
                                          style:TextStyle(
                                            color:Colors.black,
                                            fontSize:22,
                                          )
                                      ),
                                      Text(
                                        doc.isNotEmpty?"\$${snapshot.data!.docs[0].data()['medical_charge']}":'\$0',
                                          style:TextStyle(
                                            color:Colors.black,
                                            fontSize:22,
                                          )
                                      ),
                                    ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:  [
                                      const Text(
                                          "Total",
                                          style:TextStyle(
                                            color:Colors.black,
                                            fontSize:22,
                                          )
                                      ),
                                      SizedBox(width:36.0),
                                      Text(
                                          doc.isNotEmpty?'\$$total':'\$0',
                                          style:const TextStyle(
                                            color:Colors.black,
                                            fontSize:22,
                                          )
                                      ),
                                    ]
                                )
                              ]
                          );}
                          return const  Center(child:CircularProgressIndicator());
                        }
                      )
                  ),
                  //bottom-part
                  Container(
                      margin:EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      height:100,
                      width:double.infinity,
                      decoration:  BoxDecoration(
                        color:Colors.blue.shade500,
                        borderRadius:BorderRadius.circular(20),
                      ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              showVideoCallBox = !showVideoCallBox;
                              showMessageBox = false;
                            });
                          },
                          child: Column(
                            mainAxisSize:MainAxisSize.min,
                            children: [
                              Container(
                                height:40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border:Border.all(
                                      color:Colors.lightBlueAccent,
                                      width:1.5
                                    ),
                                    shape: BoxShape.circle),
                                child: const Padding(
                                  //this padding will be you border size
                                  padding:EdgeInsets.all(3.0),
                                  child: Icon(Icons.video_call_outlined,size:28,color:Colors.redAccent  ),
                                ),
                              ),
                              const Text(
                                'Video Call',
                                style:TextStyle(
                                  fontSize:18,
                                )
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              showMessageBox = !showMessageBox;
                              showVideoCallBox = false;
                            });
                          },
                          child: Column(
                            mainAxisSize:MainAxisSize.min,
                            children:[
                              Container(
                                height:40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border:Border.all(
                                        color:Colors.lightBlueAccent,
                                        width:1.5
                                    ),
                                    shape: BoxShape.circle),
                                child: const Padding(
                                  //this padding will be you border size
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(Icons.chat_bubble_outline_rounded,size:28,color:Colors.green),
                                ),
                              ),
                              const Text(
                                  'Message',
                                  style:TextStyle(
                                    fontSize:18,
                                  )
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                             setState(() {
                               isAlert = !isAlert;
                             });
                          },
                          child:Container(
                            alignment: Alignment.center,
                            height:50,
                            width:90,
                            decoration:BoxDecoration(
                              border:Border.all(
                                color:!isAlert?Colors.lightBlueAccent:
                                Colors.redAccent,
                              )
                            ),
                            child:const Text(
                              'ALERT!!',
                              style:TextStyle(
                                fontSize:20,
                                color:Colors.black,
                              )
                            )
                          ),
                        )
                      ]
                    )
                  ),
                ]
              ),
            ),
            showMessageBox?Positioned(
              bottom:150,
              left:0,
              right:0,
              child: Container(
                margin:const EdgeInsets.symmetric(horizontal:30,),
                height:300,
                decoration:BoxDecoration(
                  color:Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream:  FirebaseFirestore.instance.collection('hospital').doc('hospital_info').collection('hospital_info').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                    if(snapshot.hasData) {
                      final docs = snapshot.data!.docs.reversed.toList();
                      return ListView.builder(
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            final data = docs[index].data();
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  showMessageBox = false;
                                });
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: MediaQuery
                                                .of(ctx)
                                                .viewInsets
                                                .bottom + 20),
                                        child: SizedBox(
                                          height: Get.height,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 40,),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                         child: const Icon(
                                                          Icons.arrow_back,
                                                          color: Colors.blue,
                                                        )
                                                    ),
                                                    Text(
                                                        data['title'],
                                                        style: const  TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 130),
                                              TextField(
                                                controller: text,
                                                decoration: const InputDecoration(
                                                    labelText: 'Message Field'),
                                              ),
                                              const SizedBox(height: 30),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  await openWhatsapp(
                                                      context: ctx,
                                                      text: text.text,
                                                      number: data['title']);
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: const Text(
                                                    '    send message    '),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide( //                   <--- right side
                                          color: Colors.blueGrey,
                                          width: 1.0,
                                        ),
                                      )
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.blueGrey,
                                                    width: 1.5
                                                ),
                                                shape: BoxShape.circle),
                                            child: Icon(Icons.local_hospital,
                                                color: Colors.blueGrey)
                                        ),
                                         Text(
                                          data['title'],
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.whatsapp,
                                              color: Colors.green),
                                          onPressed: () {

                                          },
                                        )
                                      ]
                                  )
                              ),
                            );
                          }
                      );
                    }
                    return const Center (child:CircularProgressIndicator ()
                    );
                  }
                )
              ),
            ):SizedBox.shrink(),
            showVideoCallBox?Positioned(
              bottom:150,
              left:0,
              right:0,
              child: Container(
                  margin:const EdgeInsets.symmetric(horizontal:30,),
                  height:300,
                  decoration:BoxDecoration(
                    color:Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream:  FirebaseFirestore.instance.collection('hospital').doc('hospital_info').collection('hospital_info').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                      if(snapshot.hasData) {
                        final docs = snapshot.data!.docs.reversed.toList();

                        return ListView.builder(
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              final data = docs[index].data();
                              return GestureDetector(
                                onTap: () {
                                  openWhatsapp(context: context,
                                      text: '',
                                      number: data['contact']);
                                  setState(() {
                                    setState(() {
                                      showVideoCallBox = false;
                                    });
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide( //                   <--- right side
                                            color: Colors.blueGrey,
                                            width: 1.0,
                                          ),
                                        )
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.blueGrey,
                                                      width: 1.5
                                                  ),
                                                  shape: BoxShape.circle),
                                              child: Icon(Icons.local_hospital,
                                                  color: Colors.blueGrey)
                                          ),
                                          Text(
                                            data['title'],
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.video_camera_back,
                                                color: Colors.green),
                                            onPressed: () {

                                            },
                                          )
                                        ]
                                    )
                                ),
                              );
                            }
                        );
                      }
                      return const Center (child:CircularProgressIndicator ()
                      );
                    }
                  )
              ),
            ):SizedBox.shrink(),
          ],
        ),
      )
    );
  }

  Future<void> openWhatsapp(
      {required BuildContext context,
        required String text,
        required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }
}
