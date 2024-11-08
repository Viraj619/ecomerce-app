class AppExceptionPage implements Exception{
  String title,msg;
  AppExceptionPage({required this.msg,required this.title});

  String toError(){
    return '$title $msg';
  }
}

class FetchException extends AppExceptionPage{
  FetchException({required String Error}):super(title: "NetWork",msg: Error);
}
class BedRequestException extends AppExceptionPage{
  BedRequestException({required String Error}):super(title: "BedRequest",msg: Error);
}
class UnauthorisedException extends AppExceptionPage{
  UnauthorisedException({required String Error}):super(title:"Unauthorised",msg: Error);
}
class InvalidException extends AppExceptionPage{
  InvalidException({required String Error}):super(title:"Invalid",msg: Error);
}