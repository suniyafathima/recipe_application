import 'package:flutter/material.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/List_screen/list_screen.dart';
import 'package:recipe_application/view/favorites_screen/favorite_screen.dart';
import 'package:recipe_application/view/home_screen/home_screen.dart';
import 'package:recipe_application/view/search_screen/search_screen.dart';
import 'package:recipe_application/view/tastebud_screen/tastebud_screen.dart';

class BottomNavbar extends StatefulWidget {
  
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex=0;
  List screenss=[
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ListScreen(),
    TastebudScreen()
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    bottomNavigationBar:
    BottomNavigationBar(
      selectedItemColor: ColorConstants.darkblue,
      unselectedItemColor: ColorConstants.darkGrey,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (value) {
        selectedIndex=value;
        setState(() {
          
        });
      },
      items: [ 
      BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
      BottomNavigationBarItem(icon: Icon(Icons.list),label: "List"),
      BottomNavigationBarItem(icon: Icon(Icons.auto_awesome),label: "TasteBud")
      
      ]),
      body: screenss[selectedIndex],
    );
  }
}