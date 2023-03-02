
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietPage extends StatelessWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Column(
          children:[
            Row(
              children: [
                IconButton(
                  icon:const Icon(Icons.arrow_back,color:Colors.blue),
                  onPressed:(){
                    Get.back();
                  },
                ),
                const Text(
                  'Diet Tips',
                  style:TextStyle(
                    color:Colors.black,
                    fontSize:20,
                  )
                )
              ],
            ),
            Expanded(
              child:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream:  FirebaseFirestore.instance.collection('hospital').doc('diet_health_tips').collection('diet_health_tips').snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                    if(snapshot.hasData) {
                      final docs = snapshot.data!.docs.reversed.toList();
                      return ListView.builder(
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            final data = docs[index].data();
                            return Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 30, right: 30),
                              padding: const EdgeInsets.only(bottom:20,left:5.0,right:5.0,top:5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(
                                      10)),
                              child: Column(
                                children: [
                                  Text(
                                      data['tip'],
                                      style:TextStyle(
                                        fontSize:22,
                                      )
                                  )
                                ],
                              ),
                            );;
                          }
                      );
                    }
                    return const Center (child:CircularProgressIndicator ()
                    );
                  }
              )
            )
          ]
        )
      )
    );
  }
}
