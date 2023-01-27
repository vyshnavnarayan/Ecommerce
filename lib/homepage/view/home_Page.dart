import 'package:ecommerce1/add_product/view/add_product_page.dart';
import 'package:ecommerce1/index/view/index_page.dart';
import 'package:ecommerce1/login/login.dart';
import 'package:ecommerce1/myProducts/view/my_products_page.dart';
import 'package:ecommerce1/orders/view/orders_page.dart';
import 'package:ecommerce1/profile/view/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgets = [
    IndexPage(),
    MyProducts(),
    Text('data3'),
    OrdersPage(),
    ProfilePage(),
  ];

  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: 
      Center(child: _widgets[selectedItem]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.pink,
        unselectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'My Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedItem,
        onTap: (value) {
          if (value == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProduct(),
                ));
          } else {
            setState(() {
              selectedItem = value;
            });
          }
        },
      ),
    );
  }
}
