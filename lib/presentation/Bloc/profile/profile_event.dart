part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfileData extends ProfileEvent {
  const LoadProfileData();
}

