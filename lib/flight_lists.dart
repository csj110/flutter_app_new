import 'package:flutter/material.dart';

final Color discountBackgroundColor = Color(0xffffe080);
final Color flightBorderColor = Color(0xffe6e6e6);
final Color chipBackgroundColor = Color(0xfff6f6f6);

class FlightListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
