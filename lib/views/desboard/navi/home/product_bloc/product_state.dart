
import '../models/product_model.dart';

abstract class ProductState{}
class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
  ProductDataModel mProductDataModel;
  ProductLoadedState({required this.mProductDataModel});
}
class ProductErrorState extends ProductState{
  String Error;
  ProductErrorState({required this.Error});
}