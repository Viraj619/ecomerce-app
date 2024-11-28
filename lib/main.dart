
import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/theme.dart';
import 'package:ecommerce/views/desboard/navi/cart/bloc/cart_bloc.dart';
import 'package:ecommerce/views/desboard/navi/cart/create_order_bloc/order_bloc.dart';
import 'package:ecommerce/views/desboard/navi/home/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:ecommerce/views/desboard/navi/home/category_bloc/category_bloc.dart';
import 'package:ecommerce/views/desboard/navi/home/product_bloc/product_bloc.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_bloc/profile_bloc.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_bloc/view_order_bloc.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/login_bloc/login_bloc.dart';
import 'package:ecommerce/views/login%20and%20singip%20pages/login_and_singup_bloc/sinup_bloc/singup_bloc.dart';
import 'package:ecommerce/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiBlocProvider(providers:[
    BlocProvider(create: (context) => SingupBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) =>LoginBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => ProductBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => CategoryBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => AddToCartBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => CartBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => ProfileBloc(apiHelper: ApiHelper()),),
    ChangeNotifierProvider(create: (context) => ThemeProvide(),),
    BlocProvider(create: (context) => OrderBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => ViewOrderBloc(apiHelper: ApiHelper()),),
  ],child: MainApp()));
}
class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    context.read<ThemeProvide>().getTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashPage(),
      theme: ThemeData(brightness:Brightness.light),
      darkTheme: ThemeData(brightness:Brightness.dark),
      themeMode: context.watch<ThemeProvide>().getNewValue()?ThemeMode.dark:ThemeMode.light,
    );

  }
}

/// codeium plugings