
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:Dimensions.width100,
        height: Dimensions.height100,
        alignment:Alignment.center,
        decoration: BoxDecoration(
          color:Colors.blue,
          shape:BoxShape.circle,
        ),
        child: const CircularProgressIndicator(
          color:Colors.white,
        )
      ),
    );
  }
}
