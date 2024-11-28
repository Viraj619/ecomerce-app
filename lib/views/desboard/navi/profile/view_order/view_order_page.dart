
import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_bloc/view_order_bloc.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_bloc/view_order_events.dart';
import 'package:ecommerce/views/desboard/navi/profile/view_order/view_order_bloc/view_order_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ViewOrderPage extends StatefulWidget{
  @override
  State<ViewOrderPage> createState() => _ViewOrderPageState();
}

class _ViewOrderPageState extends State<ViewOrderPage> {
  DateFormat mFormat=DateFormat.jms();

  @override
  void initState() {
    super.initState();
    // context.read<ViewOrderBloc>().add(GetOrders());
    BlocProvider.of<ViewOrderBloc>(context, listen: false).add(GetOrders());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text("Placed Orders"),
      ),
     body: Column(
       children: [
         Expanded(
           child: BlocBuilder<ViewOrderBloc,ViewOrderStates>(
             builder: (_,state){

              if(state is ViewOrderLoadingState){
                return SizedBox(
                  height: 500,
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
              if(state is ViewOrderErrorState){
                return Center(child: Text(state.error),);
              }
              if(state is ViewOrderLoadedState){
                var mData=state.mOrdersDataModel;
                return ListView.builder(
                  itemCount:mData.orders!.length,
                  itemBuilder:(_, index) {
                    return Container(
                      width:350,
                      height: 140,
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// image
                            CoustomCard(imgurl:mData.orders![index].product![0].image!, width:110.00, height: 150.00),
                            Column(
                              children: [
                                /// ordered date
                                Text("Date:${mData.orders![index].created_at}",style: mTextStyle15(),),
                                SizedBox(height: 5,),
                               // Text(mFormat.format(DateTime.fromMillisecondsSinceEpoch(int.parse(mData.orders![index].created_at!)),)),
                                /// product name and delete button
                                Text("Product Name:${mData.orders![index].product![0].quantity}",style: mTextStyle15(),),
                                SizedBox(height: 5,),
                                /// product price
                                Text("Total Amount:\$${mData.orders![0].total_amount}",style: mTextStyle16(),),
                                SizedBox(height: 5,),
                                Text("Quantity:${mData.orders![index].product!.length}",style:mTextStyle16(),),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },);
              }
              return Container();
            },
           ),
         ),
       ],
     )
    );
  }
}