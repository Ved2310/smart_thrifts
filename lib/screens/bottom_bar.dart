import 'package:flutter/material.dart';

import 'package:thrift_books/consts/my_icons.dart';
import 'package:thrift_books/screens/cart.dart';
import 'package:thrift_books/screens/search.dart';
import 'package:thrift_books/screens/user_info.dart';

import 'cart.dart';
import 'feeds.dart';
import 'home.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': Feeds(),
      },
      {
        'page': Search(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': UserInfo(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              // ignore: deprecated_member_use
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  // ignore: deprecated_member_use
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.rss),
                  // ignore: deprecated_member_use
                  title: Text('Feeds'),
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  // ignore: deprecated_member_use
                  title: Text('Search'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.bag,
                  ),
                  // ignore: deprecated_member_use
                  title: Text('Cart'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  // ignore: deprecated_member_use
                  title: Text('User'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(MyAppIcons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
