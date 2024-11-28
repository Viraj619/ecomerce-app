import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/desboard/navi/cart/create_order_bloc/order_events.dart';
import 'package:ecommerce/views/desboard/navi/cart/create_order_bloc/order_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvents,OrderStates>{
  ApiHelper apiHelper;
  OrderBloc({required this.apiHelper}):super(OrderInitialState()){
    on<GetCreateOrder>((event,emit)async{
      emit(OrderLoadingState());
      try{
        var res=await apiHelper.postAPI(url:UrlsPage.Create_Order_Api);
        if(res["status"] || res["status"]=='true'){
          emit(OrderSuccessState());
        }else{
          emit(OrderFailureState(error: res["message"]));
        }
      }catch (e){
        emit(OrderFailureState(error: e.toString()));
      }
    });
  }
}