
import 'package:ecommerce/views/login%20and%20singip%20pages/models/singup_model.dart';

abstract class SinUpEvent{}
 class SingUser extends SinUpEvent{
  SingUpModel mSingModel;
  SingUser({required this.mSingModel});
 }