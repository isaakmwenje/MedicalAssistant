import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medical_assistant/data/firebase_ref/reference.dart';

import '../data/firebase_ref/loading_status.dart';
import '../data/models/appointment_model.dart';
import 'outh_controller.dart';

class DataUploader extends GetxController {
  static DataUploader instance = Get.find();
  @override
  void onReady() {
    super.onReady();
  }


  final loadingStatus = LoadingStatus.loading.obs;

  uploadData(AppointmentModel appointmentModel)async{
    loadingStatus.value = LoadingStatus.loading;
    final fireStore = FirebaseFirestore.instance;
    var batch = fireStore.batch();
    final appointmentsId = appointmentsRF('appointment','appointment');
    batch.set(appointmentsId,appointmentModel.toJson());

    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }

  void getData()async{
    var collection = fireStore.collection('hospital').doc('appointment').collection('appointments');
    var querySnapshot = await collection.where('uid',isEqualTo:OuthController.instance.uid).get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var hospital = data['hospital'];
      var time = data['time'];
    }
  }

  void getCheckUpData() async{
  var collection = fireStore.collection('hospital').doc('appointment').collection('patient_check_ups');
  var querySnapshot = await collection.where('email',isEqualTo:OuthController.instance.email).get();
  for (var queryDocumentSnapshot in querySnapshot.docs) {
  Map<String, dynamic> data = queryDocumentSnapshot.data();
  var sys = data['sys'];
  var dia = data['dia'];
  }
}

}