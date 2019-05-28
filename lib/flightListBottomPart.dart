
import 'package:flutter/material.dart';

import 'flight_lists.dart';
import 'main.dart';

class FlightListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
      ),
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 16,
          // ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                'Best Deals for Next 6 Months',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: Colors.grey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text('\$4190',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '(\$9990)',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 2,
                  children: <Widget>[
                    FlightDetailChip(Icons.calendar_today, 'June 2019'),
                    FlightDetailChip(Icons.flight_takeoff, 'Jet Airways'),
                    FlightDetailChip(Icons.star, '4.4'),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              decoration: BoxDecoration(
                  color: discountBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text('55%',
                  style: TextStyle(
                      fontSize: 15,
                      color: appTheme.primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;
  FlightDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(fontSize: 12, color: Colors.black),
      backgroundColor: Colors.black.withOpacity(0.1),
      avatar: Icon(
        iconData,
        size: 20,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}