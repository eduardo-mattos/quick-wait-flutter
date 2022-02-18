import 'package:quick_wait_android/features/find_hospital/domain/entities/hospital_entity.dart';

abstract class HospitalRepository {
  
   Future <List<HospitalEntity>> findHospitals({required double latitude, required double longitude});
}