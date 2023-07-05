import 'package:coffeeapp/util/constants/colors_dark.dart';
import 'package:coffeeapp/view/blur_effect.dart';
import 'package:coffeeapp/view/mobile/home.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'fav.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  List<Widget> currentPage = [
    Home(),
    Cart(),
    FavouriteUI(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: currentPage[currentPageIndex],
        bottomNavigationBar: BlurEffect(
          borderRadius: BorderRadius.circular(15),
          child: NavigationBar(
            height: 45,
            indicatorColor: btBrown,
            backgroundColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 500),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite),
                label: 'Fav',
              ),
            ],
          ),
        ));
  }
}
