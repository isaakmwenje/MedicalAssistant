import 'package:flutter/material.dart';

import '../../widgets/schedule/upcoming_couresel.dart';

class UpComingPage extends StatefulWidget {
  const UpComingPage({Key? key}) : super(key: key);

  @override
  State<UpComingPage> createState() => _UpComingPageState();
}

class _UpComingPageState extends State<UpComingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,itemBuilder: (BuildContext context, int index) {
        return UpcomingCarousel(index: index,);
    },);
  }
}
