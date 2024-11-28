
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_page.dart';
import 'package:flutter/material.dart';

import '../../ui_helper/coustom_card.dart';
import 'navi/home/home_page.dart';
import 'navi/cart/mycart_page.dart';

class BottomPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }

}
class BottomState extends State<BottomPage>{

  int selectedIndex=2;


  List<Widget> navigatList=[
    Text("caegory"),
    Center(child: Text("Favorite",style: mTextStyle20(),)),
    HomePage(),
    MyCartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title:  Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       CoustomPage(width: 40.00, height: 40.00,color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed: (){
      //
      //       }, icon: Icon(Icons.dashboard,size: 20,color: Colors.black,)),),
      //       SizedBox(width:MediaQuery.of(context).size.width>200?MediaQuery.of(context).size.width*0.6:MediaQuery.of(context).size.width*0.5),
      //      CoustomPage(width: 40.00, height: 40.00,color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed: (){
      //
      //       }, icon: Icon(Icons.notifications,size: 20,color: Colors.black,)),),
      //     ],
      //   ),
      // ),
      body:navigatList[selectedIndex] ,
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.orange,
       foregroundColor: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(100),
       ),
        onPressed: (){
          selectedIndex=2;
          setState(() {

          });
        },child: Icon(Icons.home_outlined),),
      bottomNavigationBar:BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              selectedIndex=0;
              setState(() {

              });
            }, icon: Icon(Icons.category)),
          IconButton(onPressed: (){
            selectedIndex=1;
            setState(() {

            });
          }, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: (){
            selectedIndex=3;
            setState(() {

            });
          }, icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: (){
            selectedIndex=4;
            setState(() {

            });
          }, icon: Icon(Icons.account_circle_outlined)),
        ],),
      ),
    );
  }
/* NavigationBar(
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
      )*/
}