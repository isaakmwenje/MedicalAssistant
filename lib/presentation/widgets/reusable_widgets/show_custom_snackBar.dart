import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'big_text.dart';


showCustomSnackBar(String message,{bool isError =true,String title = 'Error'}){
  Get.snackbar(title, message,
  titleText:BigText(text:title,color:Colors.white),
  messageText: Text(message,style:const TextStyle(color:Colors.white)),
    backgroundColor: Colors.redAccent.withOpacity(0.4),
  );
}