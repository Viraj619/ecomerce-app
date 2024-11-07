import 'package:ecommerce/coustom_card.dart';
import 'package:ecommerce/login%20and%20singip%20pages/singup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Log in "),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CoustomTextField.coustomTextField(emailController,"Enter email.."),
          CoustomTextField.coustomTextField(passController,"Enter password.."),
          SizedBox(height: 30,),
          CoustomTextField.Button((){}, Text("Log in")),
          SizedBox(height: 50,),
          CoustomTextField.textButton((){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SingupPage(),));
          }, "Create an Account!")
        ],
      ),),
    );
  }
}