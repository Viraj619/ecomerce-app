 abstract class AddToCartStates{}
 class AddCartInitialState extends AddToCartStates{}
 class AddCartLoadingState extends AddToCartStates{}
 class AddCartSuccessState extends AddToCartStates{}
 class AddCartFailurState extends AddToCartStates{
  String error;
  AddCartFailurState({required this.error});
 }