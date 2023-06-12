import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/course_basic.dart';

import '../../../Utility/locator/service_locator.dart';

import '../../../data/dto/profile_data.dart';
import '../../../domain/models/achievement.dart';
import '../../../domain/models/course.dart';
import '../../../domain/models/custom_error.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileDataInit()) {
    loadProfileData();
  }

  void loadProfileData() {
    on<LoadProfileData>((event, emit) async {
      var profileData = await locator<UserService>().getProfileData();
      if (profileData.isLeft) {
        emit(ProfileDataError(
            error: ExceptionHelper.getErrorMessage(profileData.left!)));
      }

      emit(ProfileDataReady(
          achievements: 0,
          finishedCourses: profileData.right!.finishedCourses,
          hotStreak: 0,
          learnedWords: profileData.right!.learnedWords));
    });
  }
}
