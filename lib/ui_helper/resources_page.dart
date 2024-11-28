
import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle mTextStyle20(
    {FontWeight mFontWeight = FontWeight.bold,
      Color mFontColor = Colors.black}) {
  return TextStyle(fontSize: 20, fontWeight: mFontWeight, color: mFontColor);
}

TextStyle mTextStyle16(
    {FontWeight mFontWeight = FontWeight.bold,
      Color mFontColor = Colors.black}) {
  return TextStyle(fontSize: 16, fontWeight: mFontWeight, color: mFontColor);
}

TextStyle mTextStyle13(
    {FontWeight mFontWeigh = FontWeight.bold,
      Color mFontColor = Colors.black}) {
  return TextStyle(fontSize: 13, fontWeight: mFontWeigh, color: mFontColor);
}

TextStyle mTextStyle15(
    {FontWeight mFontWeigh = FontWeight.bold,
      Color mFontColor = Colors.black}) {
  return TextStyle(fontSize: 15, fontWeight: mFontWeigh, color: mFontColor);
}
TextStyle mTextStyle25(
    {FontWeight mFontWeigh = FontWeight.bold,
      Color mFontColor = Colors.black}) {
  return TextStyle(fontSize: 25, fontWeight: mFontWeigh, color: mFontColor);
}


TextStyle mTextStyle10(
    {FontWeight mFontWeight = FontWeight.bold,
      Color mFontColor = Colors.black}) {
  return TextStyle(
    fontSize: 10,
    fontWeight: mFontWeight,
    color: mFontColor,
  );
}

class MColor{
  static List<Map<String,dynamic>> colorData=[{
   'color':Colors.blueAccent
  },
    {
      'color':Colors.redAccent
    },
    {
      'color':Colors.blue
    },
    {
      'color':Colors.orangeAccent
    },
    {
      'color':Colors.black
    },
    {
      'color':Colors.green
    },
    {
      'color':Colors.grey
    }
  ];
}

class Names{

  static String UID_KEY='Uid';

  static List<Map<String,dynamic>> nameData=[{
    'image':'asserts/icons/ic_shoes.png',
    'name':'Shoes',
    'sName':"Man Fashion",
    'price':'3000'
  },
    {
      'image':'asserts/icons/ic_jewellery.jpg',
      'name':'Jewelry',
      'sName':"Woman Fashion",
      'price':'30000',
    },
    {
      'image':'asserts/icons/ic_beauty.png',
      'name':'Beauty',
      'sName':'Woman Fashion',
      'price':'1500'
    },
    {
      'image':'asserts/icons/ic_woman.jpg',
      'name':"Women's Fashion",
      'sName':"Woman Fashion",
      'price':'2000'
    },
    {
      'image':'asserts/icons/ic_perfume.jpg',
      'name':'Perfume',
      'sName':"Woman Fashion",
      'price':'1000',
    },
    {
      'image':'asserts/icons/ic_mancloth.jpg',
      'name':"Men's Fashion",
      'sName':"Man Fashion",
      'price':'1200'
    },
    {
      'image':'asserts/icons/ic_wonamfoot.jpg',
      'name':'Foot Wears',
      'sName':"Woman Fashion",
      'price':'500'
    },
    {
      'image':'asserts/icons/ic_electronic.jpg',
      'name':'Electronic Items',
      'sName':"Electronic",
      'price':'50000'
    },
    {
      'image':'asserts/icons/ic_headset.jpg',
      'name':'Headset',
      'sName':"Electronic",
      'price':'1500'
    },
    {
      'image':'asserts/icons/ic_phone.jpg',
      'name':'Phone',
      'sName':"Electronic",
      'price':'35000'
    },
    {
      'image':'asserts/icons/ic_watch.jpg',
      'name':'Watch',
      'sName':'Electronic',
      'price':'1000'
    }
  ];
}