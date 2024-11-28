import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:ecommerce/views/desboard/navi/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FavorateItems extends StatelessWidget {
  const FavorateItems({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageState.likedItems;
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
            Center(child:Text("Favorite Items",style:mTextStyle20(),),)

            ],
          ),
        ),
      )
      ),
      body:StatefulBuilder(builder: (context, setState) {
        return ListView.builder(
          itemCount:HomePageState.likedItems.length,
          itemBuilder:(context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:50),
                child: Container(height:200,
                  width:100,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                    color:Colors.orange,
                    // image:DecorationImage(image:NetworkImage("${HomePageState.likedItems[index]["image"]}"))
                  ),
                  child:Column(
                    children: [
                      Align(
                        alignment:Alignment.topRight,
                        child: IconButton(onPressed:(){
                          if(HomePageState.mList.contains(index)){
                            HomePageState.mList.removeAt(index);
                            HomePageState.likedItems.removeAt(index);
                            setState((){});
                          }
                        }, icon:HomePageState.mList.contains(index)?Icon(Icons.favorite,color:Colors.red,):Icon(Icons.favorite,color:Colors.white,)),
                      ),
                      Image.network(HomePageState.likedItems[index]['image'],width: 200,height:100,),
                      SizedBox(height:10,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [
                          Text("Price \$:${HomePageState.likedItems[index]["price"]}",style:mTextStyle15(mFontColor:Colors.white),),
                          Text("${HomePageState.likedItems[index]["title"]}",style:mTextStyle15(mFontColor:Colors.white),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          },);
      },),
    );
  }
}
