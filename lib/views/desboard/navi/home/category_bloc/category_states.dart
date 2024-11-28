
import 'package:ecommerce/views/desboard/navi/home/models/category_model.dart';

abstract class CategoryStates{}
class CatInitialState extends CategoryStates{}
class CatLoadingState extends CategoryStates{}
class CatLoadedState extends CategoryStates{
  CategoryDataModel mCategoryDataModel;
  CatLoadedState({required this.mCategoryDataModel});
}
class CatErrorState extends CategoryStates{
  String Error;
  CatErrorState({required this.Error});
}