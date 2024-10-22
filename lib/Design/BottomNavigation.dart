import 'package:ecommeurcefb/Design/Home.dart';
import 'package:ecommeurcefb/Design/Search.dart';
import 'package:ecommeurcefb/Design/Wishlist.dart';
import 'package:ecommeurcefb/Design/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'settings/Profile.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  final Screen = [Home(), Wishlist(), Cart(), Search(), Profile()];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
     type: BottomNavigationBarType.fixed,

        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: currentindex == 0 ? Colors.red : Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  color: currentindex == 1 ? Colors.red : Colors.black),
              label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CircleAvatar(
                    radius: 30.r,backgroundColor: Colors.white,
                    child: Icon(Icons.shopping_cart,
                        color: currentindex == 2 ? Colors.red : Colors.black)),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: currentindex == 3 ? Colors.red : Colors.black),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: currentindex == 4 ? Colors.red : Colors.black),
              label: 'profile'),
        ],
      ),
      body: Screen[currentindex],
    );
  }
}
