import 'package:flutter/material.dart';
import 'main.dart';

class CustomTapBar extends StatelessWidget {
  // List<BottomNavigationBarItem> bottomBarItems = [];
  // CustomTapBar() {
  //   bottomBarItems = [
  //     BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.home,
  //           color: Colors.black,
  //         ),
  //         title: Text('Explore', style: TextStyle(color: Colors.black))),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: appTheme.primaryColor,
              ),
              title: Text('Explore',
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.normal))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: appTheme.primaryColor,
              ),
              title: Text('Watchlist',
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.normal))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.local_offer,
                color: appTheme.primaryColor,
              ),
              title: Text('Detail',
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.normal))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.notifications,
                color: appTheme.primaryColor,
              ),
              title: Text('Notifications',
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.normal))),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
