import 'package:quick_wait_android/features/auth/domain/entities/user_entity.dart';
import 'package:quick_wait_android/features/find_hospital/domain/entities/location_entity.dart';

abstract class LocationRepository {
  
   Future <List<LocationEntity>> findLocations({required String query});
}