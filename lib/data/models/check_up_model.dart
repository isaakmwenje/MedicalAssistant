
class CheckUp{

  String email;
  String sys;
  String dia;
  String pulse;

  CheckUp({required this.email,required this.sys, required this.dia,required this.pulse});

  Map<String,dynamic> toJson(){
    return {
      'email':email,
      'sys':sys,
      'dia':dia,
      'pulse':pulse,
    };
  }
}