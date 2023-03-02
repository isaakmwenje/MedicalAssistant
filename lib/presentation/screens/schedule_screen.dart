import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';
import '../pages/schedule/completed_page.dart';
import '../pages/schedule/upcoming_page.dart';
import '../widgets/reusable_widgets/big_text.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<Widget> _schedulePages = [
    UpComingPage(),
    CompletedPage(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
    body:SafeArea(
      child: Column(
        children: [
          SizedBox(height:Dimensions.height6),
          Container(
            margin:EdgeInsets.symmetric(horizontal:Dimensions.width12),
              padding:EdgeInsets.all( Dimensions.width6),
              decoration: BoxDecoration(
              color:Colors.white,
              border:Border.all(color:Colors.black12),
              borderRadius: BorderRadius.circular(8),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                GestureDetector(
                  onTap:(){
                    setState((){
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    padding:EdgeInsets.symmetric(vertical:Dimensions.height10,horizontal:Dimensions.width10*4),
                    decoration: BoxDecoration(
                      color:selectedIndex == 0 ?Colors.blue:null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:BigText(text:'Upcoming',color:selectedIndex == 0 ?Colors.white:Colors.black38),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState((){
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    padding:EdgeInsets.symmetric(vertical:Dimensions.height10,horizontal:Dimensions.width10*2),
                    decoration: BoxDecoration(
                      color:selectedIndex == 1 ?Colors.blue:null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:BigText(text:'Completed',color:selectedIndex == 1 ?Colors.white:Colors.black38),
                  ),
                )
              ]
            )
          ),
          SizedBox(height:Dimensions.height10),
          Expanded(
            child: Stack(
                  children:_schedulePages.asMap().map((i,screen) =>MapEntry(
                  i,Offstage(
                offstage:selectedIndex !=  i,
                child:screen,
              )
              )).values.toList()
            ),
          ),
        ],
      ),
    ),
      ),
    );
  }
}
