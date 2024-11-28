abstract class AddToCartEvent{}
class AddToCartItems extends AddToCartEvent{
  int product_id;
  int quantity;
  AddToCartItems({required this.product_id,required this.quantity});
}