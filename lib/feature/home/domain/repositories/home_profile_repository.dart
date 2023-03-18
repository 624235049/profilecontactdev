


import 'package:profiledevtest/feature/home/domain/entities/user_entity.dart';

abstract class HomeProfileRepository {

  Stream<List<UserEntity>> getAllUsers();

}