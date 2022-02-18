import 'dart:convert';

import 'package:quick_wait_android/features/find_hospital/domain/entities/polyline_entity.dart';
import 'package:quick_wait_android/features/find_hospital/domain/repositories/polyline_repository.dart';
import 'package:http/http.dart' as http;

class PolylineRepositoryImpl implements PolylineRepository {

  @override
  Future<List<PolylineEntity>> findPolyline({required currentLatitude, required currentLongitude, required latitude, required longitude}) async {
     var baseUrl = 'https://api.mapbox.com/v4/directions/mapbox.driving/';
    var coordinates = '$currentLongitude,$currentLatitude;$longitude,$latitude.json?access_token=';
    var token =
        'pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw';
    final uri = Uri.parse(baseUrl + coordinates + token);

    var response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception("Erro");
    }
    var items = json.decode(response.body);

    final List<PolylineEntity> polylines = [];
    items['routes'][0]['geometry']['coordinates'].forEach((item) => {
      polylines.add(PolylineEntity(latitude: item[1], longitude: item[0]))
    });
    return polylines; 
    }
}