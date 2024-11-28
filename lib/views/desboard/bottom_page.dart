
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/navi/favorate/favorate_items.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
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

 static int selectedIndex=2;


  List<Widget> navigatList=[
  Container(color:Colors.white,width:double.infinity,height:double.infinity,),
   FavorateItems(),
    HomePage(),
    MyCartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body:navigatList[selectedIndex] ,
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        backgroundColor: selectedIndex==2?Colors.orange:Colors.white,
       foregroundColor:selectedIndex==2? Colors.white:Colors.black,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(100),
       ),
        onPressed: (){
          selectedIndex=2;
          setState(() {
          });
        },child: Icon(Icons.home_outlined),),
      bottomNavigationBar:BottomAppBar(
        color:Colors.orange.shade300,
               shadowColor:Colors.orange.shade500,
               shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              selectedIndex=0;
              setState(() {

              });
            }, icon:selectedIndex==0?
            Container(
              width:50,
              height: 50,
              decoration:BoxDecoration(
                shape:BoxShape.circle,
                color:Colors.orange
              ),
              child:Center(child:Icon(Icons.category,color:Colors.white,),),
            ):Icon(Icons.category)),
          IconButton(onPressed: (){
            selectedIndex=1;
            setState(() {

            });
          }, icon:selectedIndex==1?Container(
            width:50,
            height: 50,
            decoration:BoxDecoration(
                shape:BoxShape.circle,
                color:Colors.orange
            ),
            child:Center(child:Icon(Icons.favorite_border_outlined,color:Colors.white,),),
          ):Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: (){
            selectedIndex=3;
            setState(() {

            });
          }, icon:selectedIndex==3?
          Container(
            width:50,
            height: 50,
            decoration:BoxDecoration(
                shape:BoxShape.circle,
                color:Colors.orange
            ),
            child:Center(child:Icon(Icons.shopping_cart_outlined,color:Colors.white,),),
          ):Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: (){
            selectedIndex=4;
            setState(() {

            });
          }, icon:selectedIndex==4?
          Container(
            width:50,
            height: 50,
            decoration:BoxDecoration(
                shape:BoxShape.circle,
                color:Colors.orange
            ),
            child:Center(child:Icon(Icons.account_circle_outlined,color:Colors.white,),),
          ): Icon(Icons.account_circle_outlined)),
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