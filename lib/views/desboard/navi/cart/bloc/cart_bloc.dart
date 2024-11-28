
import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/desboard/navi/cart/bloc/cart_events.dart';
import 'package:ecommerce/views/desboard/navi/cart/bloc/cart_state.dart';
import 'package:ecommerce/views/desboard/navi/cart/model/Cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvents,CartState>{
  ApiHelper apiHelper;
  CartBloc({required this.apiHelper}):super(CartInitialState()){
    on<GetCartItemEvent>((event,emit)async{
      emit(CartLoadingState());
      try{
        var res= await apiHelper.getAPI(url:UrlsPage.View_Cart_Api);
        if(res["status"]|| res["status"]=="true"){
          emit(CartLoadedState(mCartDataModel: CartDataModel.fromJson(res)));
        }else{
          emit(CartErrorState(error:res["message"]));
        }
      } catch (e){
        emit(CartErrorState(error: e.toString()));
      }
    });
  }
}