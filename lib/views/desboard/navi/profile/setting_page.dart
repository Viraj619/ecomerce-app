import 'package:ecommerce/remote/theme.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/bottom_page.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting"),),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          /// theme button
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Manage Dark and Light Theme"),
            StatefulBuilder(builder: (context, setState){
              return  Switch(value: context.watch<ThemeProvide>().getNewValue(), onChanged:(value){
                context.read<ThemeProvide>().setNewValue(value);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomPage(),));
                setState((){});
              });
            },),
          ],),
          SizedBox(height: 10,),
          /// logout
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Log out your Account!!"),
            ElevatedButton(onPressed: ()async{
              SharedPreferences pref=await SharedPreferences.getInstance();
              pref.setString(Names.UID_KEY, "");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            }, child: Text("Log out")),
          ],)
        ],),
      ),
    );
  }
}