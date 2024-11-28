import 'dart:io';

import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/sinup_bloc/singup_state.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/sinup_bloc/sinup_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingupBloc extends Bloc<SinUpEvent,SingupState>{
  ApiHelper apiHelper;
  SingupBloc({required this.apiHelper}):super(InitialSingState()){
    on<SingUser>((event, emit)async{
      emit(LoadingSingState());
      try{
       dynamic res=await apiHelper.postAPI(url:UrlsPage.Register_Api,isRequiredHeader: false,mBodyParams:{
         "name":event.mSingModel.name,
         "mobile_number":event.mSingModel.mobile_number,
         "email":event.mSingModel.email,
         "password":event.mSingModel.password,

       });
       if(res["status"]){
         emit(SuccessSingState());
       }else{
         emit(FailureSingState(Error: res["message"]));
       }
      }on SocketException catch (e){
        emit(FailureSingState(Error:e.toString()));
      }
    },);
  }
}