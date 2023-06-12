import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/course_basic.dart';

import '../../../Utility/locator/service_locator.dart';

import '../../../domain/models/achievement.dart';
import '../../../domain/models/active_course.dart';
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
      if (profileData.isError) {
        emit(ProfileDataError(
            error: ExceptionHelper.getErrorMessage(profileData.error!)));
      }

      emit(ProfileDataReady(
          achievements: 0,
          finishedCourses: profileData.data!.finishedCourses,
          hotStreak: 0,
          learnedWords: profileData.data!.learnedWords,
          beginnerProgress: profileData.data!.beginnerProgress));
    });
  }
}