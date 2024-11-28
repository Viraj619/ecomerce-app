

import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/bottom_page.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),() async {
      SharedPreferences pref= await SharedPreferences.getInstance();
      String uid=pref.getString(Names.UID_KEY)??"";
      print(uid);
      Widget login=LoginPage();
      if(uid!=""){
        login=BottomPage();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login,));
    });
    return Scaffold(
      body:Center(child: Lottie.asset("asserts/lotty_file/splash.json",width: 300,height: 300),),
    );
  }
}


