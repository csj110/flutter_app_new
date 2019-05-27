import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'customTapbar.dart';
import 'flight_lists.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopContainer(), homeScreenBottom],
      ),
      bottomNavigationBar: CustomTapBar(),
    );
  }
}

class HomeScreenTopContainer extends StatefulWidget {
  @override
  _HomeScreenTopContainerState createState() => _HomeScreenTopContainerState();
}

Color firstColor = Color(0xfff47d05);
Color secondColor = Color(0xffef70fc);
ThemeData appTheme =
    ThemeData(primaryColor: Color(0xfff3791a), fontFamily: 'oxygen');
List<String> locations = ['Boston(BOS)', 'New York City(JFK)'];
const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 20);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 20);
const iconSize = 30.0;

class _HomeScreenTopContainerState extends State<HomeScreenTopContainer> {
  var selectLocationIndex = 0;
  var isFlightSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [firstColor, secondColor],
            )),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: iconSize,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectLocationIndex],
                              style: dropDownLabelStyle,
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.white)
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(locations[0],
                                    style: dropDownMenuItemStyle),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(locations[1],
                                    style: dropDownMenuItemStyle),
                                value: 1,
                              ),
                            ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: iconSize,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Text(
                  'Where would\n you like to go?',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: TextField(
                      controller: TextEditingController(text: locations[1]),
                      style: dropDownMenuItemStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 11),
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(0),
                            child: InkWell(
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: iconSize,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FlightListScreen()));
                              },
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: ChoiceChip(
                          Icons.flight_takeoff, 'Flights', isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = false;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child:
                          ChoiceChip(Icons.hotel, 'Hotels', !isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isselected;
  ChoiceChip(this.icon, this.text, this.isselected);
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: widget.isselected
          ? null
          : BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.15, size.height - 40,
        size.width * 0.5, size.height - 40);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height - 35,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

var homeScreenBottom = Container(
  padding: EdgeInsets.all(10),
  child: Column(
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Currently watched items',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
          Spacer(),
          Text(
            'VIEW ALL(12)',
            style: TextStyle(color: appTheme.primaryColor, fontSize: 13),
          )
        ],
      ),
      Container(
        height: 230,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cityCard,
        ),
      )
    ],
  ),
);

List<CityCard> cityCard = [
  CityCard('assets/images/1.jpeg', 'Las Vegas', 'Feb 2019', '45', 4299, 2258),
  CityCard('assets/images/2.jpeg', 'Athens', 'Apr 2019', '50', 9999, 4159),
  CityCard('assets/images/3.jpeg', 'Sydney', 'Dec 2019', '40', 5999, 2399),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, mothYear, discount;
  final int oldPrice, newPrice;
  CityCard(this.imagePath, this.cityName, this.mothYear, this.discount,
      this.oldPrice, this.newPrice);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210,
                  width: 150,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  width: 160,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1)
                        ])),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            cityName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            mothYear,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "$discount%",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text("\$$newPrice",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
              Text("(\$$oldPrice)",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough))
            ],
          )
        ],
      ),
    );
  }
}
