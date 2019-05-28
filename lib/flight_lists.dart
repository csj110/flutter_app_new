// import 'package:app_new/main.dart';
import 'package:flutter/material.dart';
import 'flightListBottomPart.dart';
import 'flightlistTopPart.dart';

final Color discountBackgroundColor = Color(0xffffe080);
final Color flightBorderColor = Color(0xffe6e6e6);
final Color chipBackgroundColor = Color(0xfff6f6f6);

class InheritedFlightListScreen extends InheritedWidget {
  final String fromLocation, toLocation;
  InheritedFlightListScreen({this.fromLocation, this.toLocation, Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  static InheritedFlightListScreen of(BuildContext context )=>
  context.inheritFromWidgetOfExactType(InheritedFlightListScreen);
}

class FlightListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        centerTitle: true,
        elevation: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[FlightListTopPart(), FlightListBottomPart()],
        ),
      ),
    );
  }
}
