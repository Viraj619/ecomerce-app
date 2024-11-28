class CategoryModel{
  String? created_at;
  String? id;
  String? name;
  String? status;
  String? updated_at;
  /// constructor
 CategoryModel({this.created_at,this.id,this.name,this.status,this.updated_at});
 /// from Json
 factory CategoryModel.fromJson(Map<String,dynamic>json)=>CategoryModel(
   created_at:json['created_at'],
   id:json['id'],
   name:json['name'],
   status:json['status'],
   updated_at:json['updated_at']
 );
}
class CategoryDataModel{
  String? message;
  bool? status;
  List<CategoryModel>? data;
  /// constructor
 CategoryDataModel({this.message,this.status,this.data});
 /// from json
 factory CategoryDataModel.fromJson(Map<String,dynamic>json){
   List<CategoryModel>mData=[];
   for(Map<String,dynamic> eachData in json['data']){
     mData.add(CategoryModel.fromJson(eachData));
   }
   return CategoryDataModel(
     message:json['message'],
     status:json['status'],
     data:mData,
   );
 }
}