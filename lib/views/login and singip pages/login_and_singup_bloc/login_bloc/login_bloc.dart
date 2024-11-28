import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/login_bloc/login_events.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvents,LoginState>{
  ApiHelper apiHelper;
  LoginBloc({required this.apiHelper}):super(LoginInitialState()){
    on<AuthenticationUserEvent>((event, emit)async{
      emit(LoginLoadingState());
      dynamic mData=await apiHelper.postAPI(url:UrlsPage.Login_Api,isRequiredHeader: false,mBodyParams:{
        "email":event.email,
        "password":event.pass
      });
      if(mData["status"]){
        var uid=mData["tokan"];
        SharedPreferences pref= await SharedPreferences.getInstance();
        pref.setString(Names.UID_KEY,uid);
        emit(LoginSuccessState());
      }else{
        emit(LoginFailureState(error:mData["message"]));
      }
    },);
  }
}