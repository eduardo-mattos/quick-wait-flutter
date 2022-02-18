import 'package:quick_wait_android/features/find_hospital/domain/entities/polyline_entity.dart';

abstract class PolylineRepository {
  
   Future <List<PolylineEntity>> findPolyline({required double currentLatitude, required double currentLongitude, required double latitude, required double longitude});
}