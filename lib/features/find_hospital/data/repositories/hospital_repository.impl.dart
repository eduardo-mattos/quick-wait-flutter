// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:quick_wait_android/features/find_hospital/domain/entities/hospital_entity.dart';
import 'package:http/http.dart' as http;
import 'package:quick_wait_android/features/find_hospital/domain/repositories/hospital_repository.dart';

class HospitalRepositoryImpl implements HospitalRepository {

  @override
  Future<List<HospitalEntity>> findHospitals({required double latitude, required double longitude}) async {
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
    final uri = Uri.parse(baseUrl +
        bbox +
        '&limit=10' +
        '&language=pt-PT' +
        '&access_token=' +
        token);
    var response = await http.get(uri);
    var items = json.decode(response.body);

    final List<HospitalEntity> hospitals = [];

    items['features'].forEach((item) => {
      hospitals.add(HospitalEntity(name: item['text_pt-PT'], latitude: item['geometry']['coordinates'][1], longitude: item['geometry']['coordinates'][0]))
    });
    return hospitals; 
  }
}