import 'package:quick_wait_android/features/find_hospital/domain/entities/polyline_entity.dart';
import 'package:quick_wait_android/features/find_hospital/domain/repositories/polyline_repository.dart';

abstract class FindPolylineUseCase {
  
  Future <List<PolylineEntity>> call({required double currentLatitude, required double currentLongitude, required double latitude, required double longitude});
}

class FindPolylineUseCaseImpl implements FindPolylineUseCase {

  final PolylineRepository repository;

  FindPolylineUseCaseImpl(this.repository);

  @override
  Future <List<PolylineEntity>> call({required double currentLatitude, required double currentLongitude, required double latitude, required double longitude}) async {
    return repository.findPolyline(currentLatitude: currentLatitude, currentLongitude: currentLongitude, latitude: latitude, longitude: longitude);
  }
}