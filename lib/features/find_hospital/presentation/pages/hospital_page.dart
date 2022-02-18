import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:http/http.dart' as http;
import 'package:maps_launcher/maps_launcher.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:quick_wait_android/features/find_hospital/data/repositories/hospital_repository.impl.dart';
import 'package:quick_wait_android/features/find_hospital/data/repositories/location_repository_impl.dart';
import 'package:quick_wait_android/features/find_hospital/data/repositories/polyline_repository_impl.dart';
import 'package:quick_wait_android/features/find_hospital/domain/usecases/find_hospital_use_cases.dart';
import 'package:quick_wait_android/features/find_hospital/domain/usecases/find_location_use_cases.dart';
import 'package:quick_wait_android/features/find_hospital/domain/usecases/find_polyline_use_cases.dart';
import 'package:quick_wait_android/features/find_hospital/presentation/controllers/hospital_controller.dart';

class HospitalPage extends StatefulWidget {
  HospitalPage() : super();
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  double latitude = 0;
  double longitude = 0;
  List coordinatesList = [];
  List<Marker> markers = [];
  List<latLng.LatLng> points = [];
  bool isLoading = false;
  List<String> autoCompleteData = [];
  List searchCoordinates = [];
  final MapController mapController = MapController();
  late FindLocationUseCase findLocation;
  late FindHospitalUseCase findHospital;
  late FindPolylineUseCase findPolyline;

  @override
  void initState() {
    super.initState();
    findLocation = FindLocationUseCaseImpl(LocationRepositoryImpl());
    findHospital = FindHospitalUseCaseImpl(HospitalRepositoryImpl());
    findPolyline = FindPolylineUseCaseImpl(PolylineRepositoryImpl());
    getUserLocation();
}

  Future getItems(query) async {
    var locations = await findLocation(query: query);
    var placeNameList = locations.map((e) => e.placeName,).toList();
    searchCoordinates = locations
        .map((e) => {
              'placeName': e.placeName,
              'latitude': e.latitude,
              'longitude': e.longitude
            })
        .toList();
    setState(() {
      isLoading = false;
      autoCompleteData = placeNameList;
    });
    return placeNameList; 
  }

  Future setLocate(locate) async {
    coordinatesList.clear();
    return innerFunction(locate);
  }

  innerFunction(locate) {
    var a;
      for (var element in searchCoordinates) {
        if(element['placeName'] == locate){
            latitude = element['latitude'];
            longitude = element['longitude'];
            a = latLng.LatLng(element['latitude'], element['longitude']);
            getHospitalsLocation();
            return mapController.move(a, mapController.zoom);
        }
      }
      return false;
    }

  Future getHospitalsLocation() async {
    var hospitals = await findHospital(latitude: latitude, longitude: longitude);
    var coordinatesList = hospitals.map((e) => { 'name': e.name, 'latitude': e.latitude, 'longitude': e.longitude}).toList();

    setState(() {
      for (var item in coordinatesList) {
        markers.add(Marker(
            width: 80.0,
            height: 80.0,
            point:
                latLng.LatLng(item['latitude'] as double, item['longitude'] as double),
            builder: (context) => IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.red,
                  iconSize: 45.0,
                  onPressed: () {
                    var bottomSheet = showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          getPolyline(
                              item['latitude'] as double, item['longitude'] as double);
                          return Container(
                            color: HexColor("#90D8DC"),
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(12),
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
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 15),
                                        const ImageIcon(
                                          AssetImage(
                                              "assets/icons/hospitals.png"),
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(width: 15),
                                        Flexible(
                                          child: Text(
                                            item['name'] as String,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                height: 3.5, fontSize: 15),
                                          ),
                                        )
                                      ],
                                    )),
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
                                  child: Row(
                                    children: [
                                      Builder(builder: (context) {
                                        return const SizedBox(width: 15);
                                      }),
                                      const Flexible(
                                        child: Text(
                                          '10 minutos',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              height: 2.0, fontSize: 15),
                                        ),
                                      )
                                    ],
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
                                  child: Row(
                                    children: [
                                      Builder(builder: (context) {
                                        return const SizedBox(width: 15);
                                      }),
                                      const Flexible(
                                        child: Text(
                                          '1,2',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              height: 2.0, fontSize: 15),
                                        ),
                                      )
                                    ],
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
                                      const SizedBox(width: 15);
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
                                      const SizedBox(width: 15);
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
                                      icon: const Icon(Icons.check),
                                      onPressed: () {
                                        MapsLauncher.launchCoordinates(
                                            item['latitude'] as double,
                                            item['longitude'] as double,
                                            item['name'] as String);
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
      }
      Future.delayed(Duration(seconds: 0)).then((_) {
        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return Container(
                color: HexColor("#90D8DC"),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        ...coordinatesList.map((title) {
                          return Column(
                            children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                            ),
                            Material(
                              elevation: 4.0,
                              shadowColor: Colors.grey,
                              borderRadius: BorderRadius.circular(17),
                              child: Row(
                                children: [
                                  const SizedBox(width: 15),
                                  const ImageIcon(
                                    AssetImage("assets/icons/hospitals.png"),
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 15),
                                  Flexible(
                                    child: Text(
                                      title['name'] as String,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          height: 3.5, fontSize: 15),
                                    ),
                                  )
                                ],
                              ))
                            ]
                          );
                        }).toList(),
                      ],
                    ),
                ),
              );
            });
      });
    });
    // return response;
  }

  Future getPolyline(lat, long) async {
    var polylines = await findPolyline(currentLatitude: latitude, currentLongitude: longitude, latitude: lat, longitude: long);
    var polylinesList = polylines.map((e) => {
      'latitude': e.latitude,
      'longitude': e.longitude
    }).toList();

    setState(() {
      polylinesList.forEach((element) { 
        points.add(latLng.LatLng(element['latitude'] as double, element['longitude'] as double));
      });
    });
  }

  getUserLocation() async {
    var currentLocation = await HospitalController().getLocate();

    setState(() {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;

      var response = getHospitalsLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#90D8DC"),
        title: Material(
          elevation: 4.0,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(17),
          child: Row(
            children: [
              Builder(builder: (context) {
                return SizedBox(width: 15);
              }),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
              SizedBox(width: 15),
              Flexible(
                child: isLoading ? Center(child: CircularProgressIndicator(),) : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Autocomplete(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if(textEditingValue.text.isEmpty){
                            return const Iterable<String>.empty();
                          } else {
                            getItems(textEditingValue.text);
                            return autoCompleteData.where((word) => word 
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                          }
                        },
                        onSelected: (selectedString) {
                          setLocate(selectedString);
                        },
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ), 
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        latitude == 0
            ? Container()
            : 
            FlutterMap(
                mapController: mapController,
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
                  points.isEmpty
                      ? MarkerLayerOptions(markers: markers)
                      : PolylineLayerOptions(polylines: [
                          Polyline(
                              points: points,
                              strokeWidth: 5.0,
                              color: Colors.red)
                        ]),
                ],
              ),
      ]),
    );
  }
}