import 'package:cloud_firestore/cloud_firestore.dart';

final  fireStore = FirebaseFirestore.instance;
final  appointmentRF = fireStore.collection('hospital');
final appointmentsRf = appointmentRF.doc('appointment').collection('appointments');


DocumentReference appointmentsRF (String appointmentId,String appointmentsId)
=> appointmentRF.doc(appointmentId).collection('appointments').doc();

