import 'package:flutter/material.dart';

class NavigationBloc {
  NavigationBloc();
  navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}
