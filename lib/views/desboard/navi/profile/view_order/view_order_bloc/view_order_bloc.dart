import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls_page.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_bloc/view_order_events.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_bloc/view_order_states.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_model/view_order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewOrderBloc extends Bloc<ViewOrderEvents,ViewOrderStates>{
  ApiHelper apiHelper;
  ViewOrderBloc({required this.apiHelper}):super(ViewOrderInitialState()){
    on<GetOrders>((event,emit)async{
      emit(ViewOrderLoadingState());

      try{
        var res= await apiHelper.postAPI(url: UrlsPage.Get_Ordered_Api);
        if(res['status'] || res['status']=='true'){
          emit(ViewOrderLoadedState(mOrdersDataModel:OrdersDataModel.fromJson(res)));
        }else{
          emit(ViewOrderErrorState(error:"Error Occurred!!"));
        }
      } catch (e){
        emit(ViewOrderErrorState(error: e.toString()));
      }
    });
  }
}