import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:geolocator/geolocator.dart'
    as geolocator; // or whatever name you want
import 'package:http/http.dart' as http;

class HospitalPage extends StatefulWidget {
  HospitalPage() : super();
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  double latitude = 0;
  double longitude = 0;

  MapController controller = new MapController();
  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  Future<Position> locateUser() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future getHospitalsLocation() async {
    var baseUrl =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/Hospital%2Cupa.json?';
    final uri = Uri.parse('$baseUrl').replace(queryParameters: {
      'limit': '10',
      'language': 'pt-PT',
      'access_token':
          'pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw'
    });
    var response = await http.get(uri);
    // print(response.statusCode);
    // print(json.decode(response.body));
    return response;
  }

  getUserLocation() async {
    var currentLocation = await locateUser();
    var response = await getHospitalsLocation();

    var a = LatLngBounds(latLng.LatLng(currentLocation.latitude, currentLocation.longitude));
    print(currentLocation);
    print("Entrou aqui");
    print(a.southEast);
    print("Entrou aqui 2");
    print(a.southWest);
    setState(() {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: latitude == 0
          ? Container()
          : FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(latitude, longitude),
                zoom: 13.0,
                containPoint: (){

                }
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
                                getUserLocation();
                              },
                      )),
                  ],
                ),
                CircleLayerOptions(circles: [
                  CircleMarker(
                      //radius marker
                      point: latLng.LatLng(latitude, longitude),
                      color: Colors.blue.withOpacity(0.3),
                      borderStrokeWidth: 3.0,
                      borderColor: Colors.blue,
                      radius: 100,
                      useRadiusInMeter: true
                       //radius
                      )
                ],  // circles: circles,
              )
              ],
            ),
    );
  }
}
