



import 'package:dio/dio.dart';
import 'package:profiledevtest/config/api/api_config.dart';
import 'package:profiledevtest/feature/home/data/remote_data_source/remote_data_source.dart';
import 'package:profiledevtest/feature/home/domain/entities/user_entity.dart';


class RemoteDataSourceImpl implements RemoteDataSourceHome {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});


  @override
  Stream<List<UserEntity>> getAllUsers() async* {
    try {
      final response = await dio.get(API.BASE_URL+ API.PROFILE_CONTACT);
      final results = (response.data['results'] as List<dynamic>)
          .map((dynamic model) => UserEntity.fromModel(model))
          .toList();
      yield results;
    } catch (e) {
      throw Exception(e);
    }
  }
}



