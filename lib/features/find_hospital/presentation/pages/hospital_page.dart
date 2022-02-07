import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:geolocator/geolocator.dart'
    as geolocator; // or whatever name you want
import 'package:http/http.dart' as http;
import 'package:maps_launcher/maps_launcher.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
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
  List coordinatesList = [];
  List<Marker> markers = [];
  List<latLng.LatLng> points = [];
  void initState() {
    getUserLocation();
    super.initState();
  }

  Future<Position> locateUser() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future getHospitalsLocation() async {
    var longitudeMin = longitude - 0.05;
    var latitudeMin = latitude - 0.05;
    var longitudeMax = longitude + 0.05;
    var latitudeMax = latitude + 0.05;

    var baseUrl =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/Hospital%2Cupa.json?';

    var bbox =
        'bbox=${longitudeMin}%2C${latitudeMin}%2C${longitudeMax}%2C${latitudeMax}';
    var token =
        'pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw';
    final uri = Uri.parse('$baseUrl' +
        bbox +
        '&limit=10' +
        '&language=pt-PT' +
        '&access_token=' +
        token);
    var response = await http.get(uri);

    var items = json.decode(response.body);

    Map result;
    items['features'].forEach((item) => {
          result = {
            "coordinates": item['geometry']['coordinates'],
            "name": item['text_pt-PT']
          },
          coordinatesList.add(result),
          itemsList.add(item['text_pt-PT'])
        });

    setState(() {
      coordinatesList.forEach((item) {
        markers.add(Marker(
            width: 80.0,
            height: 80.0,
            point:
                latLng.LatLng(item['coordinates'][1], item['coordinates'][0]),
            builder: (context) => IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.red,
                  iconSize: 45.0,
                  onPressed: (  
                    
                  ) {
                    var bottomSheet = showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          getPolyline(item['coordinates'][1], item['coordinates'][0]);
                          return Container(
                            color: HexColor("#90D8DC"),
                            child: SingleChildScrollView(
                              padding: EdgeInsets.all(12),
                              child: Column(children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    'Hospital/Posto de saúde',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Quicksand'),
                                  ),
                                ),
                                Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(17),
                                  child: Align(
                                    child: Text(
                                      item['name'],
                                      textAlign: TextAlign.left,
                                      style:
                                          TextStyle(height: 2.5, fontSize: 15),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    'Tempo estimado de espera',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Quicksand'),
                                  ),
                                ),
                                Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(17),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '10 minutos',
                                      textAlign: TextAlign.left,
                                      style:
                                          TextStyle(height: 2.5, fontSize: 15),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    'Distância a ser percorrida',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Quicksand'),
                                  ),
                                ),
                                Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(17),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '1,2km',
                                      textAlign: TextAlign.left,
                                      style:
                                          TextStyle(height: 2.5, fontSize: 15),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Builder(builder: (context) {
                                      return const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      );
                                    }),
                                    Builder(builder: (context) {
                                      return const Text(
                                        'Hospital mais próximo',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Quicksand'),
                                      );
                                    })
                                  ],
                                ),
                                Row(
                                  children: [
                                    Builder(builder: (context) {
                                      return const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      );
                                    }),
                                    Builder(builder: (context) {
                                      return const Text(
                                        'Atende seu plano',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Quicksand'),
                                      );
                                    })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularButton(
                                      icon: const Icon(
                                          Icons.arrow_back_ios_rounded),
                                      onPressed: () {
                                        Modular.to.pop();
                                      },
                                    ),
                                    CircularButton(
                                      icon: const Icon(
                                          Icons.check),
                                      onPressed: () {
                                        MapsLauncher.launchCoordinates(
                                            item['coordinates'][1], item['coordinates'][0], item['name']);
                                        // Modular.to.pop();
                                      },
                                    )
                                  ],
                                ),
                              ]),
                            ),
                          );
                        });
                     bottomSheet.then((value) {
                       setState(() {
                       points = [];
                       });
                     });   
                  },
                )));
      });
    });
    return response;
  }

  Future getPolyline(lat, long) async {
    var baseUrl = 'https://api.mapbox.com/v4/directions/mapbox.driving/';
    var coordinates = '$longitude,$latitude;$long,$lat.json?access_token=';
    var token =
        'pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw';
    final uri = Uri.parse(baseUrl + coordinates + token);
    var response = await http.get(uri);
    var items = json.decode(response.body);

    setState(() {
      items['routes'][0]['geometry']['coordinates'].forEach((item) => {
      points.add(latLng.LatLng(item[1], item[0]))
    }); 
    });
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
                  points.isEmpty ? MarkerLayerOptions(markers: markers) : PolylineLayerOptions(
                    polylines: [
                      Polyline(
                        points: points,
                        strokeWidth: 5.0,
                        color: Colors.red
                      )
                    ]
                  )  ,
                ],
              ),
      ]),
    );
  }
}