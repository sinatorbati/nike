import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //انتخاب ایندکس نویگیشن بار
  int _selectedIndex = 0;
  //فانگشن برای بروز رسانی ایندکس
  //وقتی کاربر نویگیشن بار را کلیک میکند
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //صفحه برای نشان دادن
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),
    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              )),
        ),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            //logo
            Container(
              color: Colors.grey[900], // یا هر رنگ دلخواه
              padding: const EdgeInsets.symmetric(horizontal: 40),
              margin: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'lib/assets/images/logo.png',
                color: Colors.white,
                fit: BoxFit.contain,
              ),
            ),

            //pages
            const Padding(
              padding: EdgeInsets.only(
                top: 25,
                left: 25,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 25,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Adding Spacer
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(
                left: 25,
                bottom: 25,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
