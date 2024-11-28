import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvide extends ChangeNotifier{
  bool isDark=false;
  static String THEMEKEY="dark";

  /// get theme
  void getTheme()async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    isDark=pref.getBool(THEMEKEY)?? false;
    notifyListeners();
  }


  /// set  dark theme
  void setNewValue(bool newValue)async{
    isDark=newValue;
    
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool(THEMEKEY, newValue);
   
    notifyListeners();
  }
  getNewValue()=>isDark;
}