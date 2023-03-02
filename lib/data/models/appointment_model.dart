
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel{
  String uid;
  String? time;
  String? region;
  String? town;
  String? hospital;
  DateTime? dateTime;


  AppointmentModel({
   required this.dateTime,
   required this.hospital,
    required this.town,
    required this.region,
    required this.time,
    required this.uid,
});

  factory AppointmentModel.fromJson(Map<String,dynamic> json){
    return AppointmentModel(
      dateTime:(json['date_time'] as Timestamp).toDate(),
      hospital: json['hospital'],
      town:json['town'],
      region: json['region'],
      time:json['time'],
      uid:json['uid']
    );
  }

  Map<String,dynamic>toJson(){
    return {
      'date_time':dateTime,
      'hospital':hospital,
      'town':town,
      'region':region,
       'uid':uid,
      'time':time,
    };
}
}