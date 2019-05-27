import 'package:flutter/material.dart';

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
    return BottomNavigationBar(
      items: [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text('Explore', style: TextStyle(color: Colors.black))),
    ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
