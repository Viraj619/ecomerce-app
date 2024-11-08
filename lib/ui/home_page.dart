
import 'package:ecommerce/ui/addind_page.dart';
import 'package:ecommerce/ui_helper/coustom_card.dart';
import 'package:ecommerce/ui/mycart_page.dart';
import 'package:ecommerce/ui_helper/resources_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  TextEditingController searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
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
                  ButtonCoustomPage(width: MediaQuery.of(context).size.width*0.9, height: 40.00, color:Colors.grey.withOpacity(0.2), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //SizedBox(width: 20,),
                      Icon(Icons.search,size: 20,),
                     // SizedBox(width: MediaQuery.of(context).size.width*0.2,),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width*10,
                    //height:MediaQuery.of(context).size.height*0.3,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)
                      ),
                      child: Container(
                        width:  MediaQuery.of(context).size.width*10,
                       // height: MediaQuery.of(context).size.height*0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/297933/pexels-photo-297933.jpeg?auto=compress&cs=tinysrgb&w=600"),
                                fit:BoxFit.cover),
                          borderRadius: BorderRadius.circular(11)
                        ),
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
                  ),
                  /// shopping list view
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: ListView.builder(
                      itemCount: Names.nameData.length,
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (_,index){
                          return Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                CircleCoustomPage(width: 60.00, height: 60.00, imgurl: Names.nameData[index]['image'], color: Colors.white, child: Container()),
                                Container(
                                    width: 70,
                                    height: 40,
                                    child: Text(Names.nameData[index]['name'],textAlign:TextAlign.start,style: mTextStyle16(mFontWeight: FontWeight.normal),))

                              ],
                            ),
                          );
                        }),
                  ),
                  /// offer text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Special For You",style: mTextStyle25(),),
                      SizedBox(width: 100,),
                      TextButton(
                      onPressed: (){

                      }, child:Text("See all",style: mTextStyle16(mFontWeight: FontWeight.normal),))
                    ],
                  ),

                  /// grid view
                  Container(
                    width: double.infinity,
                    height: 600,
                    child: GridView.builder(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 209,
                      childAspectRatio: 9/16,
                    ),
                        itemCount: MColor.colorData.length,
                        itemBuilder: (_,index){

                      return InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>AddindPage(aIndex: index)));
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              width:500,
                              height: 600,
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),

                                ),
                                child: Column(
                                  children: [
                                    /// heart icon
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
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
                                        ],
                                      ),
                                    /// coustom widget
                                CoustomCard(imgurl:Names.nameData[index]['image'], width: 350.00, height: 160.00),
                                SizedBox(height: 20,),
                                Text(Names.nameData[index]['name']?? "default",style: mTextStyle16(),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("\$:${Names.nameData[index]['price']?? "default"}",style: mTextStyle16(),),
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
                                        SizedBox(width: 5,),
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
                                    )
                                  ],
                                ),

                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  }
}
