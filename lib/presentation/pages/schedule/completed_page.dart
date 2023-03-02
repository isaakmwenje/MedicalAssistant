import 'package:flutter/material.dart';

import '../../widgets/schedule/completed_carousel.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,itemBuilder: (BuildContext context, int index) {
      return CompletedCarousel(index: index,);
    },);
  }
}

