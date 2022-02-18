import 'package:quick_wait_android/features/find_hospital/domain/entities/location_entity.dart';
import 'package:quick_wait_android/features/find_hospital/domain/repositories/location_repository.dart';

abstract class FindLocationUseCase {
  
  Future <List<LocationEntity>> call({required String query});
}

class FindLocationUseCaseImpl implements FindLocationUseCase {

  final LocationRepository repository;

  FindLocationUseCaseImpl(this.repository);

  @override
  Future <List<LocationEntity>> call({required String query}) async {
    return repository.findLocations(query: query);
  }
}