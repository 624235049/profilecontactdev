

import '../entities/user_entity.dart';
import '../repositories/home_profile_repository.dart';

class GetAllUsersUseCase {

  final HomeProfileRepository homeProfileRepository;
  GetAllUsersUseCase({required this.homeProfileRepository});

  Stream<List<UserEntity>>getAllUsers() {
    return homeProfileRepository.getAllUsers();
  }


}