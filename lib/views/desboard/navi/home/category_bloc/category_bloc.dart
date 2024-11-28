import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/desboard/navi/home/category_bloc/category_events.dart';
import 'package:ecommerce/views/desboard/navi/home/category_bloc/category_states.dart';
import 'package:ecommerce/views/desboard/navi/home/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvents,CategoryStates>{
  ApiHelper apiHelper;
  CategoryBloc({required this.apiHelper}):super(CatInitialState()){
    on<GetCategory>((event, emit)async{
      emit(CatLoadingState());
      try{
        dynamic res=await apiHelper.getAPI(url:UrlsPage.Category_Api);
        if(res["status"]){
          emit(CatLoadedState(mCategoryDataModel:CategoryDataModel.fromJson(res)));
        }else{
          emit(CatErrorState(Error:"Error: ${res["message"]}"));
        }
      } catch (e){
        emit(CatErrorState(Error: e.toString()));
      }
    },);
  }
}