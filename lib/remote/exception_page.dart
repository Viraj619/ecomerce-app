class AppException implements Exception{
  String title,Msg;
  AppException({required this.title,required this.Msg});
  String toError(){
    return "$title $Msg";
  }
}
class FetchException extends AppException{
  FetchException({required String mError,}):super(title: "NetWork",Msg: mError);
}
class BedRequestException extends AppException{
  BedRequestException({required String mError}):super(title: "BedRequest",Msg: mError);
}
class UnauthorisedException extends AppException{
  UnauthorisedException({required String mError}):super(title: "Unauthorised",Msg:mError );
}
class InvalidException extends AppException{
  InvalidException({required String mError}):super(title: "Invalid",Msg: mError);
}