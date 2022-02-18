import 'package:quick_wait_android/features/find_hospital/domain/entities/hospital_entity.dart';
import 'package:quick_wait_android/features/find_hospital/domain/repositories/hospital_repository.dart';

abstract class FindHospitalUseCase {
  
  Future <List<HospitalEntity>> call({required double latitude, required double longitude});
}

class FindHospitalUseCaseImpl implements FindHospitalUseCase {

  final HospitalRepository repository;

  FindHospitalUseCaseImpl(this.repository);

  @override
  Future <List<HospitalEntity>> call({required double latitude, required double longitude}) async {
    return repository.findHospitals(latitude: latitude, longitude: longitude);
  }
}