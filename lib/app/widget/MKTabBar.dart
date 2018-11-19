import 'package:flutter/material.dart';

class MKTabBar extends StatefulWidget {

  final List<Widget> tabItems;
  final List<Widget> tabViews;

  MKTabBar({Key key, this.tabItems, this.tabViews});
    

  @override
  _MKTabBarState createState() => new _MKTabBarState(
    key,
    tabViews,
  );
}

class _MKTabBarState extends State<MKTabBar> with SingleTickerProviderStateMixin { 
  
} 