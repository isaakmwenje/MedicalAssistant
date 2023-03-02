import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/nearby_response.dart';
import 'package:http/http.dart' as http;


class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  String radius = '30';
  String apiKey = 'AIzaSyB6xsAhToPHXLwcASGlGJMl_vQg_8u77A4';

  double latitude = 31.5111093;
  double longitude = 74.2496;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    getNearbyPlaces();
    return  Scaffold(
        body: Stack(
          children: [
            Positioned(
              right:0,
              left:0,
              bottom:0,
              top:0,
              child: SizedBox(
                height:Get.height,
              ),
            ),
            Positioned(
              right:0,
              left:0,
              child: SizedBox(
                height:300,
                child:GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top:40,
              left:10,
              child:GestureDetector(
                onTap:(){
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color:Colors.blue.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child:const  Padding(
                    //this padding will be you border size
                    padding: const EdgeInsets.all(3.0),
                      child: const Icon(Icons.arrow_back,size:24,color:Colors.black),
                    ),
                  ),
              ),
              ),
            Positioned(
              top:270,
              left:0,
              right:0,
              bottom:0,
              child:Container(
                height:300,
                width:double.infinity,
                decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Nearby Pharmacies',
                        style:TextStyle(
                          color:Colors.blueGrey,
                          fontSize:18,
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: const EdgeInsets.only(
                            top: 10, left: 10, right: 10),
                        padding: const EdgeInsets.only(bottom:20,left:5.0,right:5.0,top:5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(
                                10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                               const  Text(
                                    'PPP  HEALTH CARE',
                                    style: TextStyle(
                                      fontSize:18,
                                    )
                                ),
                                SizedBox(width:10),
                                GestureDetector(
                                  onTap:()async{
                                    await launch("tel://0712222222");
                                  },
                                  child: Text(
                                    '0712 1222222',
                                      style: TextStyle(
                                        fontSize:18,
                                          decoration: TextDecoration.underline
                                      )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height:10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:const [
                                Text(
                                    'Opening Hours',
                                    style:const TextStyle(
                                      fontSize:18,
                                    )
                                ),
                                SizedBox(width:10),
                                Text(
                                    '24 Hrs',
                                    style:const TextStyle(
                                      fontSize:18,
                                    )
                                ),
                                SizedBox(width:30),
                              ],
                            )
                          ],
                        ),
                      ),
                      if(nearbyPlacesResponse.results != null)
                        for(int i = 0; i <
                            nearbyPlacesResponse.results!.length; i++)
                          nearbyPlacesWidget(nearbyPlacesResponse.results![i])

                    ],
                  ),
                ),
              )
            )
          ],
        ),
    );
  }
  void getNearbyPlaces() async {

    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' + latitude.toString() + ','
        + longitude.toString() + '&radius=' + radius + '&key=' + apiKey
    );

    var response = await http.post(url);

    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));
     print('google map response'+response.body);
    setState(() {});
  }
  Widget nearbyPlacesWidget(Results results) {

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text("Name: " + results.name!),
          Text("Location: " + results.geometry!.location!.lat.toString() + " , " + results.geometry!.location!.lng.toString()),
          Text(results.openingHours != null ? "Open" : "Closed"),
        ],
      ),
    );

  }
}