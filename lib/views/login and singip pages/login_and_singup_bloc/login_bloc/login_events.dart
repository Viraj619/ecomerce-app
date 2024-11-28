abstract class LoginEvents{}
class AuthenticationUserEvent extends LoginEvents{
 String email;
 String pass;
 AuthenticationUserEvent({required this.email,required this.pass});
}