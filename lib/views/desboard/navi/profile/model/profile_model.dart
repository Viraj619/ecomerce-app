class ProfileModel{
  String? created_at;
  String? email;
  String? id;
  String? image;
  String? mobile_number;
  String? name;
  String? password;
  String? updated_at;
  /// constructor
 ProfileModel({this.created_at,this.email,this.id,this.image,this.mobile_number,this.name,this.password,this.updated_at});
 /// from json
 factory ProfileModel.fromJson(Map<String,dynamic>json)=>ProfileModel(
   created_at:json['created_at'],
   email:json['email'],
   id:json['id'],
   image:json['image'],
   mobile_number:json['mobile_number'],
   name:json['name'],
   password:json['password'],
   updated_at:json['updated_at'],
 );
}

class ProfileDataModel{
  String? message;
  ProfileModel? data;
  /// constructor
 ProfileDataModel({this.message,this.data});
 /// from json
 factory ProfileDataModel.fromJson(Map<String,dynamic>json)=>ProfileDataModel(
   message:json['message'],
   data:ProfileModel.fromJson(json['data']),
 );
}