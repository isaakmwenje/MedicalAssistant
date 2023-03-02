import 'package:flutter/material.dart';
import 'package:medical_assistant/presentation/widgets/reusable_widgets/small_text.dart';

import '../../../constants/dimensions.dart';
import '../reusable_widgets/big_text.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:SafeArea(
         child:Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height:Dimensions.height10*2),
               Row(
                 children: [
                   SizedBox(width:Dimensions.width6),
                   GestureDetector(
                       onTap:(){
                         Navigator.of(context).pop();
                       },
                       child: Icon(Icons.arrow_back)),
                 ],
               ),
               SizedBox(height:Dimensions.height10),
               BigText(text:'Dentistry Check up',size:22),
               SizedBox(height: Dimensions.height10*3,),
               Container(
                 width:double.infinity,
                 alignment: Alignment.center,
                 height:Dimensions.height40,
                 child: TextField(
                   controller:textController,
                   decoration: InputDecoration(
                     suffixIcon:Icon(Icons.search),
                     hintText:'Search Hospitals...',
                     focusedBorder:OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8),
                         borderSide: const BorderSide(
                           color:Colors.black12,
                           width:1.0,
                         )
                     ),
                     enabledBorder:OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8),
                         borderSide:const BorderSide(
                           color:Colors.black12,
                           width:1.0,
                         )
                     ),
                     border:OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8),
                     ),
                   ),
                 ),
               ),
               SizedBox(height: Dimensions.height10*2),
               Expanded(
                 child: ListView.builder(
                   itemBuilder:(BuildContext context,index){
                     return Row(
                       children: [
                         Container(
                           margin:EdgeInsets.only(bottom:Dimensions.height10),
                           height:Dimensions.height10*10,
                           width:Dimensions.height10*7,
                           decoration: BoxDecoration(
                             color:Colors.yellow,
                             borderRadius: BorderRadius.circular(24),
                           ),
                         ),
                         SizedBox(width:Dimensions.width10*3),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             BigText(text:'St Joseph Hospital'),
                             SizedBox(
                                 width:Dimensions.width100*2+Dimensions.width10*4,
                                 child: SmallText(maxLines:3,text:"Discover 8000+ Hospital designs on Dribbbl")),
                             SizedBox(height:Dimensions.height10),
                             Row(children: [
                               Icon(Icons.star,color:Colors.yellow),SmallText(text:"4.3",),SmallText(text:'(112 reviews)',color:Colors.blue),
                             ],)
                           ],
                         )
                       ],

                     );
                   },
                   itemCount:4
                 ),
               ),
             ],
           ),
         )
       )
    );
  }
}
