import 'dart:convert';
import 'package:quick_wait_android/features/find_hospital/domain/entities/location_entity.dart';
import 'package:quick_wait_android/features/find_hospital/domain/repositories/location_repository.dart';
import 'package:http/http.dart' as http;

class LocationRepositoryImpl implements LocationRepository {

  @override
  Future<List<LocationEntity>> findLocations({required String query}) async {
  var baseUrl =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?';
    var types = 'types=place%2Cpostcode%2Caddress&';    
    var token =
        'access_token=pk.eyJ1IjoibWF0aGV1c2hzb3V0byIsImEiOiJja3ozMTFyd2wwMjk3MzBtOGRvdG8wdXR0In0.5ZhExvzt7Xe0A37HsBLtUw';
   final uri = Uri.parse(
        baseUrl +
        types +
        token
  );
  var response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception("Erro");
  }
  var items = json.decode(response.body);

  final List<LocationEntity> locations = [];
    items['features'].forEach((item) => {
      locations.add(LocationEntity(placeName: item['place_name'], latitude: item['center'][1], longitude: item['center'][0]))
    });
    return locations; 
  }
}