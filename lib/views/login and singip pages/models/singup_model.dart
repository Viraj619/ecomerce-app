class SingUpModel{
  String?email;
  String?mobile_number;
  String?name;
  String?password;
  /// constrictor
 SingUpModel({this.email,this.mobile_number,this.name,this.password});
 /// from json
 factory SingUpModel.fromJson(Map<String,dynamic>json)=>SingUpModel(
   name:json['name'] ,
   email: json['email'],
   mobile_number: json['mobile_number'],
   password: json['password'],
 );
 /// to map
 Map<String,dynamic> toMap(){
   return{
     'email':email,
     'mobile_number':mobile_number,
     'name':name,
     'password':password,
   };
 }
}