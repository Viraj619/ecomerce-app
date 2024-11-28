
import 'dart:async';

import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/bottom_page.dart';
import 'package:ecommerce/views/desboard/navi/cart/bloc/cart_bloc.dart';
import 'package:ecommerce/views/desboard/navi/cart/bloc/cart_events.dart';
import 'package:ecommerce/views/desboard/navi/cart/bloc/cart_state.dart';
import 'package:ecommerce/views/desboard/navi/cart/create_order_bloc/order_bloc.dart';
import 'package:ecommerce/views/desboard/navi/cart/create_order_bloc/order_events.dart';
import 'package:ecommerce/views/desboard/navi/cart/create_order_bloc/order_states.dart';
import 'package:ecommerce/views/desboard/navi/cart/model/Cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class MyCartPage extends StatefulWidget{
  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  TextEditingController disController=TextEditingController();

  num totalAmt=0;

  num discountPercentage=0.1;

  num discountAmt=0;

  num totalPrice=0;

  bool isLoading=false;

  bool isDark=false;

  @override
  Widget build(BuildContext context) {
    isDark=Theme.of(context).brightness==Brightness.dark;
    context.read<CartBloc>().add(GetCartItemEvent());
    return Scaffold(
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
              children: [
                 SizedBox(height: 40,),
                Row(
                  children: [
                    CoustomPage(width: 40.00, height: 40.00, color:Colors.white,child:Center(child: IconButton(onPressed: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomPage(),));
                    }, icon:Icon(Icons.arrow_back_ios,size: 25,color: Colors.black)))),
                    SizedBox(width: 70,),
                    Text("My Cart",style: mTextStyle20(mFontColor: isDark?Colors.white:Colors.black),)
                  ],
                ),
              ],
            ),
          ),
        )
        ),
      body:Container(
        width: double.infinity,
        height:double.infinity,
        child:Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    BlocBuilder<CartBloc,CartState>(builder: (context, state) {
                      if(state is CartLoadingState){
                        return SizedBox(
                          height: 700,
                          child: ListView.builder(itemBuilder:(_,index){
                            return Shimmer.fromColors(child: Card(
                              child: Container(
                                width:300,
                                height: 140,
                              ),
                            ), baseColor: Colors.grey.shade300 , highlightColor: Colors.white);
                          }),
                        );
                      }
                      if(state is CartErrorState){
                        return Center(child: Text(state.error),);
                      }
                      if(state is CartLoadedState){
                        discount(state.mCartDataModel.data!);
                        var mData=state.mCartDataModel;
                        return  Column(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: mData.data!.length,
                                itemBuilder: (_,index){
                                  var eachData= mData.data![index];
                                  return Container(
                                    width:300,
                                    height: 140,
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          CoustomCard(imgurl: eachData.image!, width:110.00, height: 150.00),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Column(
                                              children: [
                                                /// product name and delete button
                                                Row(

                                                  children: [
                                                    /// product  names
                                                    SizedBox(width: 100,child: Text("${mData.data![index].name}",style: mTextStyle15(),)),
                                                    IconButton(onPressed:
                                                        (){

                                                    }, icon: Icon(Icons.delete_outline,size: 20,color: Colors.orangeAccent,))
                                                  ],
                                                ),
                                                /// category name
                                                Text(Names.nameData[index]['sName'],style: mTextStyle16(mFontWeight: FontWeight.normal,mFontColor: Colors.grey)),
                                                /// product price and  quantity
                                                Row(
                                                  children: [
                                                    /// product price
                                                    Text("\$${eachData.price}",style: mTextStyle16(),),
                                                    SizedBox(width: 35,),
                                                    ButtonCoustomPage(width: 107.00, height: 40.00, color: Colors.grey.withOpacity(0.2), child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        IconButton(
                                                            onPressed: (){

                                                            }, icon: Icon(Icons.minimize_sharp,size: 20,)),
                                                        /// quantity
                                                        Text("${eachData.quantity}",style: mTextStyle16(),),
                                                        IconButton(
                                                            onPressed: (){

                                                            }, icon: Icon(Icons.add,size: 20,))
                                                      ],
                                                    ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            /// discount container
                            Container(
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Discount(10 %)",style: mTextStyle16(mFontColor: Colors.grey),),

                                          Text("\$$discountAmt",style: mTextStyle16(),)
                                        ],
                                      ),
                                      Container(
                                        width: 400,
                                        color:Colors.grey.withOpacity(0.2),
                                        height: 1,
                                      ),
                                      /// total price
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Price",style: mTextStyle16(),),

                                          Text("\$$totalPrice",style: mTextStyle16(),),

                                        ],
                                      ),
                                      /// check out button
                                      StatefulBuilder(builder:(_,setState) {
                                        return BlocListener<OrderBloc,OrderStates>(listener: (_,state){
                                          if(state is OrderLoadingState){
                                            isLoading=true;
                                            setState((){});
                                          }
                                          if(state is OrderSuccessState){
                                            isLoading=false;
                                            showDialog(context: context, builder:(context) {
                                              return Lottie.asset("asserts/lotty_file/order_placed.json",width: 200,height: 200);
                                            },);
                                            setState((){});
                                            Timer(Duration(seconds: 2),(){
                                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomPage(),));
                                            });
                                          }
                                          if(state is OrderFailureState){
                                            isLoading=false;
                                            setState((){});
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not Placed Order!!!")));
                                          }
                                        },
                                          child: ButtonCoustomPage(width: 300.00, height:50.00, color: Colors.orangeAccent, child: Center(child: TextButton(
                                              onPressed: (){
                                                context.read<OrderBloc>().add(GetCreateOrder());
                                              }, child:isLoading ? Row(
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            children: [
                                            CircularProgressIndicator(color:Colors.white,),
                                            SizedBox(width: 10,),
                                            Text("Loading....",style:mTextStyle13(mFontWeigh:FontWeight.normal,mFontColor:Colors.white),),
                                          ],):Text("Place Order",style: mTextStyle15(mFontColor: Colors.white),)))),
                                        );
                                      },)
                                    ],
                                  ),
                                ),

                              ),
                            ),
                          ],
                        );
                      }
                    return Container();
                    },),
                  ],
                ),
              ),
            ),
          ],
        )
      )
    );

  }

  /// discount function
   discount(List<CartModel>Items){
    for(CartModel eachItems in Items){
      print("discountAmt${discountAmt}");
      print("totalPrice ${totalPrice}");
      print("totalAm ${totalAmt}");
      totalAmt += num.parse(eachItems.price!)*eachItems.quantity!;
      discountAmt =totalAmt*discountPercentage;
      totalPrice=totalAmt-discountAmt;
    }
  }
}