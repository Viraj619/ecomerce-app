
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:flutter/material.dart';

import 'addind_page.dart';
import '../ui_helper/coustom_card.dart';
import 'home_page.dart';
import 'mycart_page.dart';

class BottomPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }

}
class BottomState extends State<BottomPage>{

  int selectedIndex=0;


  List<Widget> navigatList=[
    HomePage(),
    Center(child: Text("Favorite",style: mTextStyle20(),)),
    MyCartPage(),
    Center(child: Text("Prifile",style: mTextStyle20(),)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CoustomPage(width: 40.00, height: 40.00,color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed: (){

            }, icon: Icon(Icons.dashboard,size: 20,color: Colors.black,)),),
            SizedBox(width: 200,),
           CoustomPage(width: 40.00, height: 40.00,color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed: (){

            }, icon: Icon(Icons.notifications,size: 20,color: Colors.black,)),),
          ],
        ),
      ),
      body:navigatList[selectedIndex] ,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.orange,
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_border_outlined), label: "Favorite"),
          NavigationDestination(
              selectedIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.shopping_cart_outlined), label: "Add to Cart"),
          NavigationDestination(
              selectedIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined), label: "Profile")
        ],
        selectedIndex:selectedIndex ,
        onDestinationSelected: (value){
          selectedIndex=value;
          setState(() {

          });
        },
      ),
    );
  }

}