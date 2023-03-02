import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';
import '../widgets/explore/article_box.dart';
import '../widgets/explore/explore_doctor_box.dart';
import '../widgets/reusable_widgets/big_text.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned:true,
            expandedHeight:Dimensions.height10*15+Dimensions.height100,
            flexibleSpace: FlexibleSpaceBar(
              background:Container(
                decoration: const BoxDecoration(
                  color:Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    SizedBox(height:Dimensions.height10*6),
                    Container(
                      decoration: BoxDecoration(
                        color:Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin:EdgeInsets.only(top:Dimensions.height6,left:Dimensions.width12,right:Dimensions.width12),
                      alignment: Alignment.center,
                      height:Dimensions.height40,
                      child: TextField(
                        controller:textController,
                        decoration: InputDecoration(
                          prefixIcon:Icon(Icons.search),
                          hintText:'Search health tips...',
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),

                              borderSide: const BorderSide(
                                color:Colors.lightBlue,
                                width:1.0,
                              )
                          ),
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color:Colors.lightBlue,
                                width:1.0,
                              )
                          ),
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color:Colors.lightBlue,
                                width:1.0,
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height4,),
                    SizedBox(
                      height: Dimensions.height100+Dimensions.height10*5,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:4,
                          itemBuilder: (context,index){
                        return  ExploreDoctorBox(index:index);
                      }),
                    ),
                  ]
                )
              ),
            ),
            bottom:PreferredSize(
              preferredSize:Size.fromHeight(Dimensions.height6*4),
              child: Container(
                width:MediaQuery.of(context).size.width,
                height:Dimensions.height6*3,
                alignment: Alignment.center,
                decoration: const  BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.only(
                    topRight:Radius.circular(30),
                    topLeft:Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:SizedBox(
              height:MediaQuery.of(context).size.height-Dimensions.height100,
              child: ListView.builder(
                padding: EdgeInsets.only(top:Dimensions.height6*2),
                itemCount:4,
                itemBuilder: (BuildContext context, index){
                  return ArticleBox(title: 'Menstruation tips',description: 'women should definetly get a good sleep',);
                },
              ),
            )
          )
        ],
      )
    );
  }
}
