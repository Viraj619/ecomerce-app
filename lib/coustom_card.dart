
import 'package:flutter/material.dart';

class CoustomCard extends StatelessWidget{
 String imgurl;
 var width;
 var height;
  CoustomCard({required this.imgurl,required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
              height: height,
              child: Card(
                elevation: 4,
                //color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Stack(
                  children: [
                    Container(
                        width:350,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(imgurl),
                            fit: BoxFit.cover,)
                        ),
                    ),
                  ],
                ),
                ),
            ),
      ],
    );
  }
}

/// circle coustom
class CircleCoustomPage extends StatelessWidget{

  var width;
  var height;
  var child;
  var color=Colors.white;
  String imgurl;
  CircleCoustomPage({required this.width,required this.height, required this.imgurl, required this.color,required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            image: DecorationImage(image:AssetImage(imgurl),fit: BoxFit.cover),
          ),
          child:child ,
        ),
      ],
    );

  }
}

/// coustom button
class ButtonCoustomPage extends StatelessWidget{
  var width;
  var height;
  var child;
  var color;

  ButtonCoustomPage({required this.width,required this.height,required this.color,required this.child,});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20)
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}


