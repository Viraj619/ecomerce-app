import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/desboard/navi/profile/model/profile_model.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_bloc/profile_event.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_bloc/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileStates>{
  ApiHelper apiHelper;
  ProfileBloc({required this.apiHelper}):super(ProfileInitialState()){
    on<GetUserData>((event,emit)async{
      emit(ProfileLoadingState());
      try{
        var res = await apiHelper.postAPI(url: UrlsPage.Profile_Api);
        if(res['status']|| res['status']=="true"){
          emit(ProfileLoadedState(mProfileDataModel:ProfileDataModel.fromJson(res)));
        }else{
          emit(ProfileErrorState(error: res['message']));
        }
      } catch (e){
        emit(ProfileErrorState(error:e.toString()));
      }
    });
  }
}