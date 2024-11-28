import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/desboard/navi/home/product_bloc/product_event.dart';
import 'package:ecommerce/views/desboard/navi/home/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}):super(ProductInitialState()){
    on<GetProducts>((event,emit)async{
      emit(ProductLoadingState());
      try{
        dynamic res=await apiHelper.postAPI(url:UrlsPage.Product_Api,);
        if(res["status"]){
          emit(ProductLoadedState(mProductDataModel:ProductDataModel.fromJson(res)));
        } else{
          emit(ProductErrorState(Error:"Error:${res["message"]}"));
        }
      } catch (e){
        emit(ProductErrorState(Error:e.toString()));
      }
    },);
  }
}