

import '../../domain/entities/user_entity.dart';

abstract class RemoteDataSourceHome{


  Stream<List<UserEntity>> getAllUsers();


}