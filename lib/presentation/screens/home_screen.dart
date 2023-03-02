import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/dimensions.dart';
import '../drawer/dashboard_drawer.dart';
import '../pages/home/diet_page.dart';
import '../pages/home/exercise_page.dart';
import '../pages/home/google_maps.dart';
import '../pages/home/nearby_hospitals.dart';
import '../pages/home/rest_page.dart';
import '../widgets/home/cartegory_page.dart';
import '../widgets/home/category_selectory.dart';
import '../widgets/home/nearby_hospital_couresel.dart';
import '../widgets/reusable_widgets/big_text.dart';
import '../widgets/reusable_widgets/small_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          iconTheme:const IconThemeData(color:Colors.blueGrey),
          elevation:0.0,
          backgroundColor: Colors.white70,
          title:BigText(text:'Good Afternoon',color:Colors.black,size:30)
        ),
        endDrawer:const Drawer(
          child:DashBoardDrawer(),
        ),
        body:ListView(
          children:[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width:Dimensions.width100*3-Dimensions.width10*2,
                  margin:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12,right:Dimensions.width12),
                  alignment: Alignment.center,
                  height:Dimensions.height40,
                  child: TextField(
                    controller:textController,
                    decoration: InputDecoration(
                      hintText:'Search',
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color:Colors.black12,
                            width:1.0,
                          )
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:const BorderSide(
                            color:Colors.black12,
                            width:1.0,
                          )
                      ),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width:Dimensions.width6),
                Container(
                  height:Dimensions.height10*4,
                  width:Dimensions.width10*4,
                  decoration: BoxDecoration(
                    color:Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                    border:Border.all(color:Colors.white),
                  ),
                  child:Icon(Icons.search,color:Colors.white),
                )
              ],
            ),
            SizedBox(height:Dimensions.height6*4),
            Padding(
        padding:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12,right:Dimensions.width12),
              child: BigText(text:'Categories',size:18,color:Colors.black),
            ),
            SizedBox(height:Dimensions.height6*2),
            SizedBox(
              height:Dimensions.height10 * 7,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:4,
                  itemBuilder: (context,index){
                    return GestureDetector(
                        onTap:(){
                          Get.to(()=>const CategoryPage());
                        },
                        child: const CategorySelector());
                  }),
            ),
            SizedBox(height:Dimensions.height6*4),
            Padding(
              padding:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12,right:Dimensions.width12,bottom:Dimensions.height6),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.end,
                children: [
                  BigText(text:'Nearby hospitals',size:18,color:Colors.black),
                  const SmallText(text:'See more',color:Colors.blue,size:16),
                ],
              ),
            ),
            SizedBox(height:Dimensions.height6*2),
            Row(
              children:[
                GestureDetector(
                  onTap:(){
                    Get.to(()=>HospitalPage());
                  },
                    child: HospitalCouresel(color:Colors.lime.shade50)),
                SizedBox(width:Dimensions.width10),
                HospitalCouresel(color: Colors.blue.shade50,),
              ]
            ),
            SizedBox(height:Dimensions.height10),
            Row(
                children:[
                  HospitalCouresel(color: Colors.yellow.shade100,),
                  SizedBox(width:Dimensions.width10),
                  HospitalCouresel(color:Colors.brown.shade50),
                ]
            ),
            SizedBox(height:20), //health tips
  ])

      );  }
}
