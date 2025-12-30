import '../../domain/repositories/native_repository.dart';
import '../datasources/native_datasource.dart';

class NativeRepositoryImpl implements NativeRepository {
  final NativeDataSource dataSource;

  NativeRepositoryImpl(this.dataSource);

  // 🔴 MethodChannel
  @override
  Future<int> getBatteryLevel() {
    return dataSource.fetchBatteryLevel();
  }
}
