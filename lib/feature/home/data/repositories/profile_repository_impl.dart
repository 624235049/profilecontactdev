


import 'package:profiledevtest/feature/home/data/remote_data_source/remote_data_source.dart';
import 'package:profiledevtest/feature/home/domain/entities/user_entity.dart';

import '../../domain/repositories/home_profile_repository.dart';

class ProfileRepositoryHomeImpl implements HomeProfileRepository{

  final RemoteDataSourceHome remoteDataSourceHome;

  ProfileRepositoryHomeImpl({required this.remoteDataSourceHome});


  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSourceHome.getAllUsers();


}