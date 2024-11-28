 import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/desboard/navi/home/add_to_cart_bloc/add_to_cart_States.dart';
import 'package:ecommerce/views/desboard/navi/home/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/sinup_bloc/singup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartBloc extends Bloc<AddToCartEvent,AddToCartStates>{
  ApiHelper apiHelper;
  AddToCartBloc({required this.apiHelper}):super(AddCartInitialState()){
    on<AddToCartItems>((event,emit)async{
      emit(AddCartLoadingState());
      try{
        var res=await apiHelper.postAPI(url:UrlsPage.Add_To_Cart_Api,mBodyParams: {
          "product_id":event.product_id,
          "quantity":event.quantity
        });
        if(res["status"] || res["status"]=="true"){
          emit(AddCartSuccessState());
        }else{
          emit(AddCartFailurState(error:res["message"]));
        }

      } catch (e){
        emit(AddCartFailurState(error:e.toString()));
      }
    });

  }
}