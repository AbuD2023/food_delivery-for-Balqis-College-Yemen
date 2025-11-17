import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/domain/auth_remote_data_source.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../models/user_login_dtos_model.dart';
import '../models/user_sign_in_dtos_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<User> getUser(int userId) async {
    try {
      // Try to get from API first
      final remoteItems = await remoteDataSource.getUser(userId);
      // Sync to local
      return remoteItems;
    } catch (e) {
      // Fallback to local data
      final localItems = localDataSource.getUser(userId);
      // Return empty list if local is also empty (cart is empty, not an error)
      return localItems;
    }
  }

  @override
  Future<User> signIn(UserSignInDtosModel userSignIn) async {
    try {
      // Try to get from API first
      final remoteItems = await remoteDataSource.signIn(userSignIn);
      // Sync to local
      return remoteItems;
    } catch (e) {
      // Fallback to local data
      final localItems = localDataSource.signIn(userSignIn);
      // Return empty list if local is also empty (cart is empty, not an error)
      return localItems;
    }
  }

  @override
  Future<User> login(UserLoginDtosModel userLogin) async {
    try {
      // Try to get from API first
      final remoteItems = await remoteDataSource.login(userLogin);
      // Sync to local
      return remoteItems;
    } catch (e) {
      // Fallback to local data
      final localItems = localDataSource.login(userLogin);
      // Return empty list if local is also empty (cart is empty, not an error)
      return localItems;
    }
  }

  @override
  Future<bool> signOut(int userId) async {
    try {
      // Try to get from API first
      final remoteItems = await remoteDataSource.signOut(userId);
      // Sync to local
      return remoteItems;
    } catch (e) {
      // Fallback to local data
      final localItems = localDataSource.signOut(userId);
      // Return empty list if local is also empty (cart is empty, not an error)
      return localItems;
    }
  }
}
