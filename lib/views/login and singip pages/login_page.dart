
import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/views/desboard/bottom_page.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/login_bloc/login_events.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/login_bloc/login_state.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'login_and_singup_bloc/login_bloc/login_bloc.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController= TextEditingController();

  TextEditingController passController= TextEditingController();

   bool isHidden=true;

   bool isLoading=false;
   GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /*String pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
    RegExp regExp =RegExp(pattern);*/
    return Form(
      key:formkey,
      child: Scaffold(
        appBar:AppBar(
          title: Text("Login "),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("asserts/lotty_file/login.json",width: 300,height: 300),
                MyTextFormField(validation:(value){
                     if(value==null || value.isEmpty){
                       return "Please fill this field!";
                     } else{
                       return null;
                     }
                },textEditingController: emailController,hintText:"Enter email",child: Icon(Icons.email),),
                StatefulBuilder(
                  builder: (_,setState) {
                    return  MyTextFormField(
                        validation: (value){
                          if(value==null || value.isEmpty){
                            return "Please fill this field!";
                          }else{
                            return null;
                          }
                        },
                        textEditingController: passController,
                        obscuringCharacter: "*",
                        isVisible: isHidden,
                        hintText:"Enter password",
                        child:IconButton(onPressed: (){
                      isHidden=!isHidden;
                      setState((){});
                    },icon:isHidden?Icon(Icons.visibility_off):Icon(Icons.visibility),));
            
                  }
                ),
                SizedBox(height: 20,),
                BlocListener<LoginBloc,LoginState>(listener: (_,state){
                  if(state is LoginLoadingState){
                    isLoading=true;
                    setState(() {
            
                    });
                  }
                  if(state is LoginSuccessState){
                    isLoading=false;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomPage(),));
                  }
                  if(state is LoginFailureState){
                    isLoading=false;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error:${state.error}")));
                 setState(() {
            
                 });
                  }
                },child: CoustomTextField.Button((){
                  if(formkey.currentState!.validate()){
                    context.read<LoginBloc>().add(AuthenticationUserEvent(email: emailController.text, pass: passController.text));
                  }
                },
                    isLoading? SizedBox(width: 200,child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  CircularProgressIndicator(color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("Loading...",style:TextStyle(color: Colors.white),)
                ],),):Text("Login")),),
                SizedBox(height: 50,),
                CoustomTextField.textButton((){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SingupPage(),));
                }, "Create an Account!")
              ],
            ),
          ),
        ),
      ),
    );
  }
}