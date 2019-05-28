import 'package:app_new/flight_lists.dart';
import 'package:flutter/material.dart';

import 'main.dart';
class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '$InheritedFlightListScreen.of(context).fromLocation',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Divider(
                            color: Colors.black,
                            indent: 0.1,
                            height: 20.0,
                          ),
                          Text(
                            '$InheritedFlightListScreen.of(context).fromLocation',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.import_export,
                      color: Colors.black,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
