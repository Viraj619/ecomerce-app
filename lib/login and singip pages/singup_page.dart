import 'package:ecommerce/coustom_card.dart';
import 'package:flutter/material.dart';

class SingupPage extends StatelessWidget{
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Text("Sing Up"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CoustomTextField.coustomTextField(userNameController,"Enter User Name..."),
        CoustomTextField.coustomTextField(emailController,"Enter email..."),
        CoustomTextField.coustomTextField(passController,"Enter pass..."),
          SizedBox(height: 30,),
          CoustomTextField.Button((){}, Text("Sing Up")),
          SizedBox(height: 50,),
          CoustomTextField.textButton((){
            Navigator.pop(context);
          },"All read have Account ?")
      ],),),
    );
  }
}