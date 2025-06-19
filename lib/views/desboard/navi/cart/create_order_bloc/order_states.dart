abstract class OrderStates{}
class OrderInitialState extends OrderStates{}
class OrderLoadingState extends OrderStates{}
class OrderSuccessState extends OrderStates{}
class OrderFailureState extends OrderStates{
  String error;
  OrderFailureState({required this.error});
}