
import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/sinup_bloc/singup_bloc.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/models/singup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'login_and_singup_bloc/sinup_bloc/singup_state.dart';
import 'login_and_singup_bloc/sinup_bloc/sinup_event.dart';

class SingupPage extends StatefulWidget {
  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  bool isLoading = false;

  bool isHidden = true;
  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key:formKey,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 200,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "SignUp",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// user name
                /*CoustomTextField.coustomTextField(userNameController,
                    "Enter User Name...", Icon(Icons.account_circle_outlined)),*/
                MyTextFormField(validation: (value){
                  if(value==null||value.isEmpty){
                    return "Please fill this field!";
                  }else{
                    return null;
                  }
                }, textEditingController:userNameController, hintText:"Enter User Name...", child:Icon(Icons.account_circle_outlined)),
                /// phone number
               /* CoustomTextField.coustomTextField(phoneNumberController,
                    "Enter mobile Number...", Icon(Icons.phone_enabled_outlined)),*/
                MyTextFormField(validation: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill this field!";
                  }else{
                    return null;
                  }
                }, textEditingController:phoneNumberController, hintText:"Enter mobile Number...", child:Icon(Icons.phone_enabled_outlined)),

                /// email
                /*CoustomTextField.coustomTextField(emailController,
                    "Enter email...", Icon(Icons.email_outlined)),*/
                MyTextFormField(validation: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill this field!";
                  }else{
                    return null;
                  }
                }, textEditingController:emailController, hintText:"Enter email...", child:Icon(Icons.email_outlined)),

                /// password
                StatefulBuilder(builder: (_, setState) {
                  return MyTextFormField(validation: (value){
                    if(value==null || value.isEmpty){
                      return "Please fill this field!";
                    }else{
                      return null;
                    }
                  }, textEditingController: passController,obscuringCharacter:"*",isVisible:isHidden,hintText: "Enter Password...", child: IconButton(onPressed: (){
                    isHidden=!isHidden;
                    setState((){});
                  }, icon: isHidden?Icon(Icons.visibility_off):Icon(Icons.visibility)));

                  /*Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15),
                    child: TextField(
                      controller: passController,
                      obscureText: isHidden,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          hintText: "Enter Password...",
                          suffixIcon: IconButton(
                              onPressed: () {
                                isHidden = !isHidden;
                                setState(() {});
                              },
                              icon: isHidden
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  );*/
                }),
                SizedBox(
                  height: 30,
                ),
                BlocListener<SingupBloc, SingupState>(
                  listener: (context, state) {
                    if (state is LoadingSingState) {
                      isLoading = true;
                      setState(() {});
                    }
                    if (state is SuccessSingState) {
                      isLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Account Created Scccesfully!")));
                      Navigator.pop(context);
                    }
                    if (state is FailureSingState) {
                      isLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: ${state.Error}")));
                    }
                  },
                  child: CoustomTextField.Button(() {
                    if (formKey.currentState!.validate()) {
                      context.read<SingupBloc>().add(SingUser(
                          mSingModel: SingUpModel(
                              email: emailController.text,
                              name: userNameController.text,
                              mobile_number: phoneNumberController.text,
                              password: passController.text)));
                    }
                  },
                      isLoading
                          ? SizedBox(
                        width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 CircularProgressIndicator(color: Colors.white,),
                                  Text(
                                    "Loading...",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          : Text("SignUp")),
                ),
                SizedBox(
                  height: 50,
                ),
                CoustomTextField.textButton(() {
                  Navigator.pop(context);
                }, "All read have Account ?")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
