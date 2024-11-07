
import 'package:ecommerce/addind_page.dart';
import 'package:ecommerce/bottom_page.dart';
import 'package:ecommerce/coustom_card.dart';
import 'package:ecommerce/home_page.dart';
import 'package:ecommerce/login%20and%20singip%20pages/login_page.dart';
import 'package:ecommerce/mycart_page.dart';
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