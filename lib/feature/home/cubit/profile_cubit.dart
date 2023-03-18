import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/entities/user_entity.dart';
import '../domain/usecases/get_all_user_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  final GetAllUsersUseCase getAllUsersUseCase;
  ProfileCubit({required this.getAllUsersUseCase}) : super(ProfileInitial());

  Future<void> getAllUsers() async {
    emit(ProfileLoading());
    try {
      getAllUsersUseCase.getAllUsers().listen((listAllUsers) {
        emit(ProfileLoaded(users: listAllUsers));
      });

    } on SocketException catch (_) {
      emit(ProfileFailure());
    } catch (_) {

      emit(ProfileFailure());
    }

  }

}
