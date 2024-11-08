
import 'package:ecommerce/ui/addind_page.dart';
import 'package:ecommerce/ui/bottom_page.dart';
import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui/home_page.dart';
import 'package:ecommerce/ui/mycart_page.dart';
import 'package:ecommerce/ui/login%20and%20singip%20pages/login_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}
class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(),
    );

  }
}