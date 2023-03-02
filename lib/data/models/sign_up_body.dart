class SignUpBody{

  String? fName;
  String? lName;
  String password;
  String email;
  String? hospitalInst;
  String? specialization;
  String? hospitalWorkInst;
  bool? isUser;
  bool? isDoctor;
  bool? isHospitalInst;


  SignUpBody({ this.fName,
    this.lName,required this.email,required this.password,this.isUser,
   this.isDoctor,this.isHospitalInst,this.specialization,this.hospitalWorkInst,
   this.hospitalInst});

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data =  Map<String,dynamic> ();

    data['email']=email;
    data['l_name']=lName;
    data['f_name'] =fName;
    data['is_inst'] = hospitalWorkInst;
    data['inst']  = hospitalInst;
    data['password']=password;
    data['is_user'] = isUser;
    data['is_doctor'] = isDoctor;
    data['specialization']  = specialization;
    return {
      'email':email,
      'l_name':lName,
       'f_name':fName,
      'password':password,
      'is_user':isUser,
      'is_doctor':isDoctor,
      'is_inst':isHospitalInst,
      'inst':hospitalInst,
      'specialization':specialization,
      'work_inst':hospitalWorkInst,
    };
  }
}