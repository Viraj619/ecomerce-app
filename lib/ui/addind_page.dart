

import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:flutter/material.dart';

class AddindPage extends StatelessWidget{
    int aIndex;
  AddindPage({required this.aIndex});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: double.infinity,
       height:double.infinity,
       color: Colors.grey.withOpacity(0.2),
       child: Stack(
         children: [
           SingleChildScrollView(
             child: Column(
               children: [
                 SizedBox(height: 10,),
                 /// buttons
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CoustomPage(width: 40.00, height: 40.00,color: Colors.grey.withOpacity(0.2),child:Center(
                         child: IconButton(
                           onPressed: (){
                             Navigator.pop(context);
                           },icon:Center(child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,)) ,
                         ),
                       ) ,),
                       SizedBox(width: 100,),
                       CoustomPage(width: 40.00, height: 40.00, color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed:(){

                       }, icon: Center(child: Icon(Icons.share,size: 25,color: Colors.black,))),),
                       CoustomPage(width: 40.00, height: 40.00,color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed: (){

                       }, icon: Center(child: Icon(Icons.favorite_border,size: 25,color: Colors.black,))),)
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                   child: Container(
                     width: double.infinity,
                     height: 240,
                     decoration: BoxDecoration(
                       color: Colors.grey,
                       image: DecorationImage(image: AssetImage(Names.nameData[aIndex]['image']),
                       fit: BoxFit.cover),
                     ),
                   ),
                 ),
                 //SizedBox(height: 30,),
                 /// slider container
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       width: 10 ,
                       height: 10,
                       decoration: BoxDecoration(
                           color: Colors.black,
                         shape: BoxShape.circle
                       ),
                     ),
                     Container(
                       width: 10 ,
                       height: 10,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                         border:Border.all(color: Colors.black,
                         width: 1)
                       ),
                     ),
                     Container(
                       width: 10 ,
                       height: 10,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                         border: Border.all(color:Colors.black,
                         width: 1)
                       ),
                     ),
                     Container(
                       width: 10 ,
                       height: 10,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                         border: Border.all(color: Colors.black,
                         width: 1)
                       ),
                     ),
                     Container(
                       width: 10 ,
                       height: 10,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                         border: Border.all(color: Colors.black,
                         width: 1)
                       ),
                     ),
                   ],
                 ),
                 Stack(
                   children: [
                     Align(
                       alignment: Alignment.bottomCenter,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 35),
                         child: Card(
                           elevation: 4,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.vertical(top: Radius.circular(50),)
                           ),
                           child: Container(
                             width: double.infinity,
                             height: 400,
                             //color:Colors.orange,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   //SizedBox(height: 10,),
                                   Text(Names.nameData[aIndex]['name'],style: mTextStyle20(),),
                                   Text("\$: ${Names.nameData[aIndex]['price']}",style: mTextStyle20(),),
                                   /// seller
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Text("Seller:",style: mTextStyle16(mFontWeight: FontWeight.normal),),
                                       Text("Tariqul islam",style: mTextStyle16(),)
                                     ],
                                   ),
                                   /// review
                                   Row(
                                     children: [
                                       Container(
                                         width: 50,
                                         height: 25,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(11),
                                           color: Colors.orange
                                         ),
                                         child:Row(
                                           children: [
                                             Icon(Icons.star,color: Colors.white,),
                                             Text("4.8",style: mTextStyle10(mFontWeight: FontWeight.normal,mFontColor: Colors.white),),
                                           ],
                                         )
                                       ),
                                       Text("(320 Review)",style: mTextStyle15(mFontColor: Colors.grey,mFontWeigh: FontWeight.normal),)
                               
                                     ],
                                   ),
                                   Text("Color",style: mTextStyle20(),),
                                   /// colors
                                   Row(
                                     children: [
                                       CoustomPage(width: 30.00, height: 30.00,color: Colors.red,child: Container(),),
                                       SizedBox(width: 10,),
                                      CoustomPage(width: 30.00, height: 30.00, color:Colors.black,child: Container(),),
                                       SizedBox(width: 10,),
                                       CoustomPage(width: 30.00, height: 30.00, color:Colors.blueAccent,child: Container()),
                                       SizedBox(width: 10,),
                                       CoustomPage(width: 30.00, height: 30.00, color:Colors.redAccent,child: Container()),
                                       SizedBox(width: 10,),
                                       CoustomPage(width: 30.00, height: 30.00,  color:Colors.grey,child: Container())
                                     ],
                                   ),
                                  // SizedBox(height: 10,),
                                   /// description
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                      ButtonCoustomPage(width: 100.00, height: 30.00, color:Colors.orange, child: Center(child: Text("Discription",style: mTextStyle16(mFontColor: Colors.white,mFontWeight: FontWeight.normal),))),
                                       ButtonCoustomPage(width: 100.00, height: 30.00, color: Colors.white, child: Center(child: Text("Spacification",style: mTextStyle16(mFontWeight: FontWeight.normal),))),
                                       ButtonCoustomPage(width: 100.00, height: 30.00, color: Colors.white, child: Center(child: Text("Reviews",style: mTextStyle16(mFontWeight: FontWeight.normal),))),
                               
                                     ],
                                   ),
                                   /// description
                                   Container(
                                     width: double.infinity,
                                     height: 100,
                                     child: Text("Headphones are electronic devices that people wear over their ears to listen to audio from a variety of devices, including computers, smartphones, and MP3 players. They can also be called earphones, stereophones, headsets, or ",
                                         style: mTextStyle13(mFontColor: Colors.grey),textAlign: TextAlign.start,)
                                   ),
                                   /// add to cart  tab
                                   Align(
                                     alignment: Alignment.bottomCenter,
                                     child: ButtonCoustomPage(width: 350.00, height: 50.00, color: Colors.black, child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         /// count button
                                         ButtonCoustomPage(width: 100.00, height: 50.00, color: Colors.black, child:Row(
                                           children: [
                                             Container(
                                               width: 100,
                                               height: 40,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(20),
                                                 border: Border.all(color: Colors.white,
                                                 width: 1),
                                               ),
                                               child:Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                 children: [
                                                   Text("-",style: TextStyle(color: Colors.white),),
                                                   Text("1",style: TextStyle(color: Colors.white),),
                                                   Text("+",style: TextStyle(color: Colors.white),)
                                                 ],
                                               ),
                                             ),
                                           ],
                                         )),
                                         /// add to cart button
                                         ButtonCoustomPage(width: 150.00, height: 50.00, color: Colors.orange, child: Center(child: Text("Add to cart",style:mTextStyle16(mFontWeight: FontWeight.normal,mFontColor: Colors.white),)))
                                       ],
                                     )),
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 )
             
               ],
             ),
           ),
         ],
       ),
     ),
   );

  }
}
