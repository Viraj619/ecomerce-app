class ProductOrderedModel{
  int? id;
  int? quantity;
  String? image;
  String? name;
  String? price;
  /// constructor
 ProductOrderedModel({this.id,this.quantity,this.image,this.price,this.name});
 /// from json
factory ProductOrderedModel.fromJson(Map<String,dynamic>json)=>ProductOrderedModel(
  quantity:json['quantity'],
  price: json['price'],
  name: json['name'],
  image: json['image'],
  id: json['id'],
);
}
class OrdersModel{
  int? id;
  String? created_at;
  String? order_number;
  String? total_amount;
  List<ProductOrderedModel>?product;
  /// constructor
 OrdersModel({this.id,this.created_at,this.order_number,this.product,this.total_amount});
 /// from json
 factory OrdersModel.fromJson(Map<String,dynamic>json){
   List<ProductOrderedModel>mData=[];
   for(Map<String,dynamic>eachOrder in json['product']){
     mData.add(ProductOrderedModel.fromJson(eachOrder));
   }
   return OrdersModel(
     id:json['id'],
     created_at: json['created_at'],
     order_number: json['order_number'],
     total_amount: json['total_amount'],
     product:mData,
   );
 }
}
class OrdersDataModel{
  String? message;

  List<OrdersModel>?orders;
  /// constructor
 OrdersDataModel({this.message,this.orders});
 /// from json
factory OrdersDataModel.fromJson(Map<String,dynamic>json){
  List<OrdersModel> mData=[];
  for(Map<String,dynamic>eachData in json['orders']){
    mData.add(OrdersModel.fromJson(eachData));
  }
  return OrdersDataModel(
    message:json['message'],
    orders:mData
  );
}
}