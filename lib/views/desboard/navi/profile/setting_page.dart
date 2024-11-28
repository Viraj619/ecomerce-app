import 'package:ecommerce/remote/theme.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/bottom_page.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget{
  bool isDark=false;
  @override
  Widget build(BuildContext context) {
    isDark=Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      // backgroundColor:isDark?Colors.black:Colors.white,
      backgroundColor:Colors.white,
      appBar:PreferredSize(preferredSize: Size(double.infinity,70), child:Container(decoration:BoxDecoration(
          gradient:LinearGradient(colors:[
            Colors.orange.shade300,Colors.white
          ],
              begin:Alignment.topCenter,
              end:Alignment.bottomCenter
          )
      ),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:5),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  IconButton(onPressed:(){
                    Navigator.pop(context);
                  }, icon:Icon(Icons.arrow_back_ios_new_rounded)),
                  Text("Setting",style:mTextStyle20(),),
                ],
              )

            ],
          ),
        ),
      )
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          /// theme button
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Manage Dark and Light Theme",style: mTextStyle16(),),
            StatefulBuilder(builder: (context, setState){
              return  Switch(
                thumbIcon:WidgetStatePropertyAll(Icon(Icons.sunny)),
                  activeColor:Colors.black,
                  inactiveThumbColor:Colors.white,
                  value: context.watch<ThemeProvide>().getNewValue(), onChanged:(value){
                context.read<ThemeProvide>().setNewValue(value);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomPage(),));
                setState((){});
              });
            },),
          ],),
          SizedBox(height: 10,),
          /// logout
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Log out your Account!!",style: mTextStyle16(),),
            ElevatedButton(onPressed: ()async{
              SharedPreferences pref=await SharedPreferences.getInstance();
              pref.setString(Names.UID_KEY, "");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            },style:ElevatedButton.styleFrom(backgroundColor:Colors.orange.shade400),child: Text("Log out",style: mTextStyle15(mFontColor:Colors.white),)),
          ],)
        ],),
      ),
    );
  }
}