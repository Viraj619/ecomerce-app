import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_bloc/profile_bloc.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_bloc/profile_event.dart';
import 'package:ecommerce/views/desboard/navi/profile/profile_bloc/profile_states.dart';
import 'package:ecommerce/views/desboard/navi/profile/setting_page.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(GetUserData());
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingPage(),));
          }, icon: Icon(Icons.settings)),
        ],
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// user info
              BlocBuilder<ProfileBloc,ProfileStates>(builder: (_, state) {
                if(state is ProfileLoadingState){
                  return SizedBox(
                    height: 700,
                    child: ListView.builder(itemBuilder:(_,index){
                      return Shimmer.fromColors(child: Card(
                        child: Container(
                          width:300,
                          height: 100,
                        ),
                      ), baseColor: Colors.grey.shade300 , highlightColor: Colors.white);
                    }),
                  );
                }
                if(state is ProfileErrorState){
                  return Center(child: Text(state.error),);
                }
                if(state is ProfileLoadedState){
                  var mData=state.mProfileDataModel;
                  return Column(
                    children: [
                      /// profile picture
                      FittedBox(
                        child: Container(height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              shape:BoxShape.circle,
                            image:DecorationImage(image:NetworkImage("https://cdn-icons-png.flaticon.com/128/3135/3135715.png"),fit:BoxFit.cover)
                          ),),
                      ),
                      /// user name
                      Text("${mData.data!.name}"),
                      /// email
                      Padding(
                        padding: const EdgeInsets.only(right:200.0),
                        child: Text("Your Email"),
                      ),
                      SizedBox(height: 10,),
                      CoustomContainer(child: Text("${mData.data!.email}"),child1:Icon(Icons.email),),
                      SizedBox(height: 10,),
                      /// phone number
                      Padding(
                        padding: const EdgeInsets.only(right:210.0),
                        child: Text("Phone Number"),
                      ),
                      SizedBox(height: 10,),
                      CoustomContainer(child: Text("${mData.data!.mobile_number}"),child1:Icon(Icons.phone),),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right:210.0),
                        child: Text("Password"),
                      ),
                      SizedBox(height: 10,),
                      CoustomContainer(child: Text("${mData.data!.password}"),child1:Icon(Icons.add),),
                    ],);
                }
                return Container();
          
              },),
              SizedBox(height: 20,),
              /// order details
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border:Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// orders
                        InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewOrderPage(),));
                          },
                          child: Container(
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                              border:Border.all(color: Colors.grey.withOpacity(0.2))
                            ),
                            child:Row(children: [
                              Icon(Icons.card_giftcard),
                              SizedBox(width: 10,),
                              Text("Orders")
                            ],)
                          ),
                        ),
                        /// wishlist
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.grey.withOpacity(0.2))
                          ),
                          child:Row(children: [
                            Icon(Icons.favorite_border_outlined),
                            SizedBox(width: 10,),
                            Text("Wishlist")
                          ],)
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// coupons
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.grey.withOpacity(0.2))
                          ),
                          child:Row(children: [
                            Icon(Icons.local_offer_outlined),
                            SizedBox(width: 10,),
                            Text("Coupons")
                          ],)
                        ),
                        /// help center
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.grey.withOpacity(0.2))
                          ),
                          child:Row(children: [
                            Icon(Icons.headset_mic_rounded),
                            SizedBox(width: 10,),
                            Text("Heip Center")
                          ],)
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
