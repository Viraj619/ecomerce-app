import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_model/view_order_model.dart';

abstract class ViewOrderStates{}
class ViewOrderInitialState extends ViewOrderStates{}
class ViewOrderLoadingState extends ViewOrderStates{}
class ViewOrderLoadedState extends ViewOrderStates{
  OrdersDataModel mOrdersDataModel;
  ViewOrderLoadedState({required this.mOrdersDataModel});
}
class ViewOrderErrorState extends ViewOrderStates{
  String error;
  ViewOrderErrorState({required this.error});
}