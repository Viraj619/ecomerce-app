import 'package:ecommerce/views/desboard/navi/profile/model/profile_model.dart';

abstract class ProfileStates{}
class ProfileInitialState extends ProfileStates{}
class ProfileLoadingState extends ProfileStates{}
class ProfileLoadedState extends ProfileStates{
  ProfileDataModel mProfileDataModel;
  ProfileLoadedState({required this.mProfileDataModel});
}
class ProfileErrorState extends ProfileStates{
  String error;
  ProfileErrorState({required this.error});
}
