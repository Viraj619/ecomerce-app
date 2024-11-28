import 'package:ecommerce/views/desboard/navi/cart/model/Cart_model.dart';

abstract class CartState {}
class CartInitialState extends CartState{}
class CartLoadingState extends CartState{}
class CartLoadedState extends CartState{
CartDataModel mCartDataModel;
CartLoadedState({required this.mCartDataModel});
}
class CartErrorState extends  CartState{
  String error;
  CartErrorState({required this.error});
}