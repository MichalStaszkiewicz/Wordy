import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/course_basic.dart';

import '../../../Utility/locator/service_locator.dart';

import '../../../domain/models/achievement.dart';
import '../../../domain/models/active_course.dart';
import '../../../domain/models/course.dart';
import '../../../domain/models/custom_error.dart';
import '../../../domain/models/user_achievement.dart';

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
      } else {
        emit(ProfileDataReady(
          finishedCourses: profileData.data!.finishedCourses,
          hotStreak: profileData.data!.hotStreak,
          learnedWords: profileData.data!.learnedWords,
          beginnerProgress: profileData.data!.beginnerProgress,
          achievements: profileData.data!.achievements,
          fullName: profileData.data!.fullName.capitalize!,
        ));
      }
    });
  }
}
