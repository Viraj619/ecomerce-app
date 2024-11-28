
import 'dart:core';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/navi/home/detail_page.dart';
import 'package:ecommerce/views/desboard/navi/home/category_bloc/category_states.dart';
import 'package:ecommerce/views/desboard/navi/home/product_bloc/product_bloc.dart';
import 'package:ecommerce/views/desboard/navi/home/product_bloc/product_event.dart';
import 'package:ecommerce/views/desboard/navi/home/product_bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import 'category_bloc/category_bloc.dart';
import 'category_bloc/category_events.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  TextEditingController searchController =TextEditingController();
  List<Widget>mBanner=[
    Container(
      margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 150,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/297933/pexels-photo-297933.jpeg?auto=compress&cs=tinysrgb&w=600"),
            fit:BoxFit.cover),
        borderRadius: BorderRadius.circular(11)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Super Sale",style: mTextStyle20(),),
          Text("Discount",style: mTextStyle20(),),
          Row(
            children: [
              Text("Up to",style: mTextStyle13(),),
              Text("50%",style: mTextStyle25(),)
            ],
          ),
          SizedBox(height: 20,),
          ButtonCoustomPage(width: 100.00, height: 30.00, color:Colors.orangeAccent, child: Center(child: Text("Shop now",style: mTextStyle15(mFontColor: Colors.white,mFontWeigh: FontWeight.normal),)))
        ],
      ),
    ),
  ),
    Container(
      margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 150,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?auto=compress&cs=tinysrgb&w=600"),
            fit:BoxFit.cover),
        borderRadius: BorderRadius.circular(11)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Super Sale",style: mTextStyle20(),),
          Text("Discount",style: mTextStyle20(),),
          Row(
            children: [
              Text("Up to",style: mTextStyle13(),),
              Text("50%",style: mTextStyle25(),)
            ],
          ),
          SizedBox(height: 20,),
          ButtonCoustomPage(width: 100.00, height: 30.00, color:Colors.orangeAccent, child: Center(child: Text("Shop now",style: mTextStyle15(mFontColor: Colors.white,mFontWeigh: FontWeight.normal),)))
        ],
      ),
    ),
  ),
    Container(
      margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 150,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/1152077/pexels-photo-1152077.jpeg?auto=compress&cs=tinysrgb&w=600"),
            fit:BoxFit.cover),
        borderRadius: BorderRadius.circular(11)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Super Sale",style: mTextStyle20(),),
          Text("Discount",style: mTextStyle20(),),
          Row(
            children: [
              Text("Up to",style: mTextStyle13(),),
              Text("50%",style: mTextStyle25(),)
            ],
          ),
          SizedBox(height: 20,),
          ButtonCoustomPage(width: 100.00, height: 30.00, color:Colors.orangeAccent, child: Center(child: Text("Shop now",style: mTextStyle15(mFontColor: Colors.white,mFontWeigh: FontWeight.normal),)))
        ],
      ),
    ),
  ),
    Container(
      margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 150,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/2113994/pexels-photo-2113994.jpeg?auto=compress&cs=tinysrgb&w=600"),
            fit:BoxFit.cover),
        borderRadius: BorderRadius.circular(11)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Super Sale",style: mTextStyle20(),),
          Text("Discount",style: mTextStyle20(),),
          Row(
            children: [
              Text("Up to",style: mTextStyle13(),),
              Text("50%",style: mTextStyle25(),)
            ],
          ),
          SizedBox(height: 20,),
          ButtonCoustomPage(width: 100.00, height: 30.00, color:Colors.orangeAccent, child: Center(child: Text("Shop now",style: mTextStyle15(mFontColor: Colors.white,mFontWeigh: FontWeight.normal),)))
        ],
      ),
    ),
  ),
    Container(
      margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 150,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/1658696488/photo/close-up-of-gold-and-diamond-necklace-with-pair-of-earrings.jpg?b=1&s=612x612&w=0&k=20&c=N_LZAmjwCB2qwkCPH6PrSmKlO2yd0R8PWNVx8oR1Unc="),
            fit:BoxFit.cover),
        borderRadius: BorderRadius.circular(11)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Super Sale",style: mTextStyle20(),),
          Text("Discount",style: mTextStyle20(),),
          Row(
            children: [
              Text("Up to",style: mTextStyle13(),),
              Text("50%",style: mTextStyle25(),)
            ],
          ),
          SizedBox(height: 20,),
          ButtonCoustomPage(width: 100.00, height: 30.00, color:Colors.orangeAccent, child: Center(child: Text("Shop now",style: mTextStyle15(mFontColor: Colors.white,mFontWeigh: FontWeight.normal),)))
        ],
      ),
    ),
  ),
  ];
  int currentPosition=0;
  bool isDark=false;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProducts());
    context.read<CategoryBloc>().add(GetCategory());
  }

  @override
  Widget build(BuildContext context) {
    isDark=Theme.of(context).brightness==Brightness.dark;
  return SafeArea(
    child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    /// search bar
                    ButtonCoustomPage(width: MediaQuery.of(context).size.width*10, height: 40.00, color:Colors.grey.withOpacity(0.2), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.search,size: 20,),
                        Container(
                          width:MediaQuery.of(context).size.width*0.4,
                          height: 50,
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                                hintText: "Search....."
                            ),
                          ),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          width: 1,
                          color: Colors.black45,
                        ),
                        IconButton(
                            onPressed: (){
    
                            }, icon: Icon(Icons.drag_indicator,size: 20,))
                      ],
                    )),
                    /// card
                    CarouselSlider(
                            items:mBanner,
                            options: CarouselOptions(
                                height:250,
                              onPageChanged: (index,_){
                                currentPosition=index;
                                setState(() {
    
                                });
                              },
                              autoPlay:true,
                              aspectRatio: 16/9,
                              viewportFraction: 1,
                              autoPlayCurve:Curves.fastLinearToSlowEaseIn,
                              autoPlayAnimationDuration: Duration(milliseconds: 800)
                            ),),
                    /// dotsIndicator
                    DotsIndicator(dotsCount:mBanner.length,
                      position: currentPosition,
                    decorator: DotsDecorator(
                      activeColor: Colors.orange,
                      color: Colors.black38,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                    ),
    
                    ///  category items
                    BlocBuilder<CategoryBloc,CategoryStates>(builder: (_,state){
                      if(state is CatLoadingState){
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder:(_,index){
                            return Shimmer.fromColors(child: Container(
                              margin:EdgeInsets.all(5),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.black,
                               shape: BoxShape.circle
                              ),
                              child:Column(children: [
                                SizedBox(height:10,),
                                Shimmer.fromColors(child:Container( width: 100,
                                  height: 30,), baseColor:Colors.grey.shade300, highlightColor:Colors.white30),
                                SizedBox(height:10,),
                                Shimmer.fromColors(child:Container( width: 100,
                                  height: 30,), baseColor:Colors.grey.shade300, highlightColor:Colors.white30)
                              ],),
                            ), baseColor: Colors.grey.shade300 , highlightColor: Colors.white);
                          }),
                        );
                      }
                      if(state is CatErrorState){
                        return Center(child: Text(state.Error));
                      }
                      if(state is CatLoadedState){
                        return  Container(
                          width: double.infinity,
                          height: 100,
                          child: ListView.builder(
                              itemCount:state.mCategoryDataModel.data!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_,index){
                                var  eachData = state.mCategoryDataModel.data![index];
                                return Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                       CircleCoustomPage(width: 60.00, height: 60.00, imgurl:Names.nameData[index]['image'], color: Colors.white, child: Container()),
                                       Text(eachData.name.toString(),textAlign:TextAlign.start,style: mTextStyle16(mFontWeight: FontWeight.normal,mFontColor: isDark?Colors.white:Colors.black),)
    
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                      return Container();
                    }),
                    /// offer text and see all button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Special For You",style: mTextStyle25(mFontColor: isDark?Colors.white:Colors.black),),
    
                        TextButton(
                        onPressed: (){
    
                        }, child:Text("See all",style: mTextStyle16(mFontWeight: FontWeight.normal,mFontColor: isDark?Colors.white:Colors.black),))
                      ],
                    ),
    
                    /// product items list
                    BlocBuilder<ProductBloc,ProductState>(builder:(_,state){
                      if(state is ProductLoadingState){
                       return SizedBox(
                         height: 500,
                         child: GridView.builder(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:195,mainAxisSpacing: 20,crossAxisSpacing: 20,
                         childAspectRatio:10/14
                         ), itemBuilder:(_,context){
                           return Shimmer.fromColors(child: Card(
                             child: Container(
                               height: 200,
                               width: 200,
                               decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child:Column(children: [
                                 SizedBox(height:10,),
                                 Shimmer.fromColors(child:Container( width: 100,
                                 height: 30,), baseColor:Colors.grey.shade300, highlightColor:Colors.white30),
                                 SizedBox(height:10,),
                                 Shimmer.fromColors(child:Container( width: 100,
                                   height: 30,), baseColor:Colors.grey.shade300, highlightColor:Colors.white30)
                               ],),
                             ),
                           ), baseColor: Colors.grey.shade300 , highlightColor: Colors.white);
                         }),
                       );

                      }
                      if(state is ProductErrorState){
                       return Center(child: Text(state.Error));
                      }
                      if(state is ProductLoadedState){
                        var mData= state.mProductDataModel;
                        return GridView.builder(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:195,
                          childAspectRatio: 10/14,
                        ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: mData.data!.length,
                            itemBuilder: (_,index){
                          var eachData=mData.data![index];
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage(productModel:mData.data![index],aIndex: index)));
                                },
                                child: Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:2.0),
                                    child: Column(
                                      children: [
                                        /// like icons
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            FittedBox(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(13)),
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                      onPressed: (){

                                                      }, icon: Icon(Icons.favorite_border,size: 30,)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        /// products  images
                                        Hero(tag: '$index', child: Image.network(eachData.image!,height:MediaQuery.of(context).size.height>150?MediaQuery.of(context).size.height*0.1:MediaQuery.of(context).size.height*0.4,fit: BoxFit.cover,),),

                                        /// products names
                                        FittedBox(child: Text(eachData.name?? "default",style: mTextStyle16(mFontColor:isDark?Colors.white:Colors.black),)),
                                        /// products prices
                                        FittedBox(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("\$:${eachData.price?? "default"}",style: mTextStyle16(mFontColor: isDark?Colors.white:Colors.black),),
                                              SizedBox(width: 4,),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.black,
                                                        width: 1)
                                                ),
                                                child: Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                      color:MColor.colorData[index]['color'],
                                                      shape: BoxShape.circle,
                                                      border: Border.all(color: Colors.white,
                                                          width: 1)
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 4,),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  //color: Coulor.colorData[index]['Scolor']['scolor'][index],
                                                  color: Colors.blueAccent,
                                                  shape: BoxShape.circle,

                                                ),
                                              ),
                                              SizedBox(width: 4,),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(width: 4,),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.black,
                                                        width: 1)
                                                ),
                                                child: Center(child: Text("+2")),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ),
                              );
                            });
                      }
                      return Container();
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  }

}
