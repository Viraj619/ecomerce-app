
import 'package:ecommerce/coustom_card.dart';
import 'package:ecommerce/resources_page.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget{
  TextEditingController disController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height:double.infinity,
        color: Colors.grey.withOpacity(0.2),
        child:Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Row(
                    children: [
                      CircleCoustomPage(width: 30.00, height: 30.00, imgurl:"", color:Colors.white,child: Center(child: Icon(Icons.arrow_back_ios,size: 15,color: Colors.black,)),),
                      SizedBox(width: 70,),
                      Text("My Cart",style: mTextStyle20(),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                   width: double.infinity,
                   height: 355,
                   child: ListView.builder(
                     itemCount: Names.nameData.length,
                       itemBuilder: (_,index){
                         return Container(
                           width: double.infinity,
                           height: 140,
                           child: Card(
                             elevation: 4,
                             color: Colors.white,
                             child: Row(
                               children: [
                                CoustomCard(imgurl: Names.nameData[index]['image'], width:100.00, height: 100.00),
                                 Column(
                                   children: [
                                     Row(
                                       children: [
                                         Container(
                                           width:95,
                                             height: 30,
                                             child: Text(Names.nameData[index]['name'],style: mTextStyle15(),)),
                                         SizedBox(width: 50,),
                                         IconButton(onPressed:
                                         (){

                                         }, icon: Icon(Icons.delete_outline,size: 20,color: Colors.orangeAccent,))
                                       ],
                                     ),
                                     //Text("Woman Fashion",style: mTextStyle16(mFontWeight: FontWeight.normal,mFontColor: Colors.grey),),
                                     Text(Names.nameData[index]['sName'],style: mTextStyle16(mFontWeight: FontWeight.normal,mFontColor: Colors.grey)),
                                     Row(
                                       children: [
                                         Text("\$70.00",style: mTextStyle16(),),
                                         SizedBox(width: 35,),
                                         ButtonCoustomPage(width: 107.00, height: 40.00, color: Colors.grey.withOpacity(0.2), child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             IconButton(
                                                 onPressed: (){

                                                 }, icon: Icon(Icons.minimize_sharp,size: 20,)),
                                             Text("1",style: mTextStyle16(),),
                                             IconButton(
                                                 onPressed: (){

                                                 }, icon: Icon(Icons.add,size: 20,))
                                           ],
                                         ))
                                       ],
                                     )
                                   ],
                                 )
                               ],
                             ),
                           ),
                         );
                       }),),
                  Stack(
                    children: [
                      Align(
                       alignment: Alignment.bottomCenter,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 1.0),
                         child: Container(
                           width: double.infinity,
                           height: 200,
                           child: Card(
                             elevation: 4,
                             color: Colors.white,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.vertical(top:Radius.circular(15))
                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(6.0),
                               child: Column(
                                 children: [
                                   SizedBox(height: 10,),
                                   /// Discount code
                                ButtonCoustomPage(width: 350.00, height: 50.00, color: Colors.grey.withOpacity(0.2), child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:200,
                                      child: TextField(
                                        controller: disController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Discount Code",
                                          hintStyle: TextStyle(
                                          )
                                        ),

                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    TextButton(
                                   onPressed: (){

                                   }, child: Text("Apply",style: mTextStyle20(mFontColor: Colors.orangeAccent),))
                                  ],
                                )),
                                   SizedBox(height: 5,),
                                   ///
                                   Row(
                                     children: [
                                       Text("Subtotal",style: mTextStyle16(mFontColor: Colors.grey),),
                                       SizedBox(width: 200,),
                                       Text("\$245.00",style: mTextStyle16(),)
                                     ],
                                   ),
                                   Container(
                                    width: 400,
                                    color:Colors.grey.withOpacity(0.2),
                                    height: 1,
                                   ),
                                   /// total price
                                   Row(
                                     children: [
                                       Text("Total",style: mTextStyle16(),),
                                       SizedBox(width: 200,),
                                       Text("\$245.00",style: mTextStyle16(),),

                                     ],
                                   ),
                                   /// check out button
                                   ButtonCoustomPage(width: 300.00, height:50.00, color: Colors.orangeAccent, child: Center(child: TextButton(
                                       onPressed: (){

                                       }, child: Text("Checkout",style: mTextStyle15(mFontColor: Colors.white),))))
                                 ],
                               ),
                             ),

                           ),
                         ),
                       ),
                      ),
                    ],
                  ),


                ],
              ),
            )
          ],
        )
      )
    );
    
  }
}