class CartModel{
  int? id;
  String? image;
  String? name;
  String? price;
  int? product_id;
  int? quantity;
  /// constructor
 CartModel({this.id,this.image,this.name,this.price,this.product_id,this.quantity});
 /// from Json
 factory CartModel.fromJson(Map<String,dynamic>json)=>CartModel(
   id: json['id'],
   image: json['image'],
   name: json['name'],
   price: json['price'],
   product_id: json['product_id'],
   quantity: json['quantity']
 );
}

class CartDataModel{
  String? message;
  bool? status;
  List<CartModel>? data;
  /// constructor
 CartDataModel({this.message,this.status,this.data});
 /// from Json
 factory CartDataModel.fromJson(Map<String,dynamic>json){
   List<CartModel>mCart=[];
   for(Map<String,dynamic> eachData in json['data']){
     mCart.add(CartModel.fromJson(eachData));
   }
   return CartDataModel(
     message:json['message'],
     status: json['status'],
     data:mCart,

   );
 }
}