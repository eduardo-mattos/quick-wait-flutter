import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:geolocator/geolocator.dart' as geolocator; // or whatever name you want
import 'package:http/http.dart' as http;
import 'package:quick_wait_android/design_system/buttons/rounded_icon_button.dart';
import 'package:quick_wait_android/features/home/presentation/widgets/home_large_button.dart';

class HospitalPage extends StatefulWidget {
  HospitalPage() : super();
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  double latitude = 0;
  double longitude = 0;
  List itemsList = [];
  
  void initState() {
    getUserLocation();
    super.initState();
  }

  Future<Position> locateUser() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future getHospitalsLocation() async {
    var longitudeMin = longitude - 0.01;
    var latitudeMin = latitude - 0.01;
    var longitudeMax = longitude + 0.01;
    var latitudeMax = latitude + 0.01;

    var baseUrl =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/Hospital%2Cupa.json?';

    var bbox = 'bbox=${longitudeMin}%2C${latitudeMin}%2C${longitudeMax}%2C${latitudeMax}';
    var token = 'pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw';
    final uri = Uri.parse('$baseUrl' + bbox + '&limit=10' + '&language=pt-PT' + '&access_token=' + token);
    var response = await http.get(uri);

    var items = json.decode(response.body);

    items['features'].forEach((item) => {
      itemsList.add(item['text_pt-PT'])
    });
    return response;
  }

  getUserLocation() async {
    var currentLocation = await locateUser();

    setState(() {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;

      var response = getHospitalsLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        latitude == 0
            ? Container()
            : FlutterMap(
                options: MapOptions(
                  center: latLng.LatLng(latitude, longitude),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/matheushsouto/ckz31yo9s000o16n6wtlzgitt/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw",
                      additionalOptions: {
                        'accessToken':
                            'pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw',
                        'id': 'mapbox.mapbox-streets-v8'
                      }),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                          width: 80.0,
                          height: 80.0,
                          point: latLng.LatLng(latitude, longitude),
                          builder: (context) => IconButton(
                                icon: const Icon(Icons.location_on),
                                color: Colors.red,
                                iconSize: 45.0,
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (builder) {
                                        return Container(
                                          color: HexColor("#E4FDFF"),
                                          child: Center(
                                            child: Column(
                                              children: itemsList.map((item) => 
                                                 HomeLargeButton(
                                                  height: 50,
                                                  onPressed: () {},
                                                  title: item,
                                                  icon: Image.asset(
                                                    "assets/icons/hospitals.png",
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                            ),
                                          ),
                                        );
                                      });
                                },
                              )),
                    ],
                  ),
                ],
              ),
      ]),
    );
  }
}