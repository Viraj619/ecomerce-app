

import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/navi/home/add_to_cart_bloc/add_to_cart_States.dart';
import 'package:ecommerce/views/desboard/navi/home/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:ecommerce/views/desboard/navi/home/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:ecommerce/views/desboard/navi/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget{
  int aIndex;
  ProductModel productModel;

  DetailPage({required this.aIndex,required this.productModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count=0;

  bool isLoading=false;
  bool isDark=false;

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness==Brightness.dark;
    return SafeArea(
      child: Scaffold(
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
                              },icon:Center(child: Icon(Icons.arrow_back_ios,size: 25,color: isDark?Colors.white:Colors.black,)) ,
                            ),
                          ) ,),
                          SizedBox(width: 100,),
                          CoustomPage(width: 40.00, height: 40.00, color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed:(){
      
                          }, icon: Center(child: Icon(Icons.share,size: 25,color: isDark?Colors.white:Colors.black,))),),
                          CoustomPage(width: 40.00, height: 40.00,color: Colors.grey.withOpacity(0.2),child: IconButton(onPressed: (){
      
                          }, icon: Center(child: Icon(Icons.favorite_border,size: 25,color: isDark?Colors.white:Colors.black,))),)
                        ],
                      ),
                    ),
                    Hero(tag: '${widget.aIndex}',child: Image.network(widget.productModel.image!,width: 210,)),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //SizedBox(height: 10,),
                                      Text(widget.productModel.name!,style: mTextStyle20(mFontColor:isDark?Colors.white:Colors.black),),
                                      Text("\$: ${widget.productModel.price}",style: mTextStyle20(mFontColor: isDark?Colors.white:Colors.black),),
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
                                          ButtonCoustomPage(width: 95.00, height: 30.00, color:Colors.orange, child: Center(child: Text("Discription",style: mTextStyle16(mFontColor: Colors.white,mFontWeight: FontWeight.normal),))),
                                          ButtonCoustomPage(width: 95.00, height: 30.00, color: Colors.white, child: Center(child: Text("Spacification",style: mTextStyle16(mFontWeight: FontWeight.normal),))),
                                          ButtonCoustomPage(width: 95.00, height: 30.00, color: Colors.white, child: Center(child: Text("Reviews",style: mTextStyle16(mFontWeight: FontWeight.normal),))),

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
                                        child: ButtonCoustomPage(width: 410.00, height: 50.00, color: Colors.black38, child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            /// count button
                                          ButtonCoustomPage(width: 140.0, height: 40.0, color: Colors.black,child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  TextButton(onPressed: (){
                                                    if(count>0){
                                                      count--;
                                                      setState((){});
                                                    }
                                                  }, child: Text("-",style: TextStyle(color: Colors.white),),),
                                                  Text("$count",style: TextStyle(color: Colors.white),),
                                                  TextButton(onPressed: (){
                                                    count++;
                                                    setState((){});
                                                  }, child:Text("+",style: TextStyle(color: Colors.white),))
                                                ],
                                              ),),
      
                                            /// add to cart button
      
                                            BlocListener<AddToCartBloc,AddToCartStates>(listener: (context, state) {
                                                if(state is AddCartLoadingState){
                                                  isLoading=true;
                                                  setState((){});
                                                }
                                                if(state is AddCartSuccessState){
                                                  isLoading=false;
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added Successfully!!!",style:mTextStyle15(mFontColor:Colors.white),),backgroundColor: Colors.orange,));
                                                }
                                                if(state is AddCartFailurState){
                                                  isLoading=false;
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.error}",style:mTextStyle15(mFontColor:Colors.white),),backgroundColor: Colors.orange,));
                                                setState((){});
                                                }
                                              },
                                              child: InkWell(onTap:(){
                                             /// set data
                                             context.read<AddToCartBloc>().add(AddToCartItems(product_id:int.parse(widget.productModel.id!), quantity:count));
                                              },child: ButtonCoustomPage(width: 140.00, height: 40.00, color: Colors.orange, child:isLoading?
                                              Row(children: [
                                                CircularProgressIndicator(),
                                                SizedBox(width: 10,),
                                                Text("Loading....")
                                              ],):Center(child: Text("Add to cart",style:mTextStyle16(mFontWeight: FontWeight.normal,mFontColor: Colors.white),)))),
                                            ),
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
      ),
    );

  }
}
