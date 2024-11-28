
import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
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
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController= TextEditingController();

  TextEditingController passController= TextEditingController();

   bool isHidden=true;

   bool isLoading=false;
   GlobalKey<FormState> formkey = GlobalKey<FormState>();

   static String pattern=r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  @override
  Widget build(BuildContext context) {
       RegExp regExp =RegExp(pattern);
    return Form(
      key:formkey,
      child: Scaffold(
        appBar:AppBar(
          backgroundColor:Colors.orange.shade200,
          title: Text("Login "),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:BoxDecoration(
            gradient:LinearGradient(colors:[Colors.orange.shade200,Colors.white],
            begin:Alignment.topCenter,
              end:Alignment.bottomCenter
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("asserts/lotty_file/login.json",width: 300,height: 300),
                MyTextFormField(validation:(value){
                     if(value==null || value.isEmpty){
                       return "Please fill this field!";
                     } else if(!regExp.hasMatch(value)){
                       return "Enter the valid Email";
                     }
                },textInputType:TextInputType.emailAddress,textEditingController: emailController,hintText:"Enter email",child: Icon(Icons.email),),
                StatefulBuilder(
                  builder: (_,setState) {
                    return  MyTextFormField(
                        validation: (value){
                          if(value==null || value.isEmpty){
                            return "Please fill this field!";
                          }else{
                            return null;
                          }
                        },textInputType:TextInputType.visiblePassword,
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
                    isLoading? SizedBox(width: 200,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        CircularProgressIndicator(color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("Loading...",style:TextStyle(color: Colors.white),)
                                      ],),
                    ),):Text("Login",style:mTextStyle16(mFontWeight:FontWeight.normal,mFontColor:Colors.white),)),),
                SizedBox(height: 50,),
                CoustomTextField.textButton((){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SingupPage(),));
                }, "Create an Account!"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}