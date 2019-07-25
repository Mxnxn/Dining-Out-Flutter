import 'package:blemacion_app/pages/HomePage.dart';
import 'package:blemacion_app/pages/LoginPage.dart';
import 'package:blemacion_app/pages/OffersPage.dart';
import 'package:blemacion_app/pages/SearchPage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex;

  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  callPage(index) {
    switch (index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return SearchPage();
        break;
      case 2:
        return Align(alignment: Alignment.center, child: Text('Cart'));
        break;
      case 3:
        return Align(alignment: Alignment.center, child: Text('Account'));
        break;
    }
  }

  callAppBar() {
    if (_currentIndex == 0) {
      return AppBar(
        elevation: 12,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 13),
            child: Row(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Container(
                      height: 20.0,
                      width: 40.0,
                      child: Text(
                        'Now ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 2.0),
                  Text('..........'),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 10.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: 20.0,
                      width: 180.0,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.gps_fixed,
                              color: Colors.black,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      )),
                  SizedBox(height: 2.0),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 35),
                child: Text(' '),
              ),
              Container(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 13),
                child: Image.asset(
                  'assets/images/discount.png',
                  height: 30,
                  width: 30,
                ),
              )),
              Container(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 10, right: 2.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OffersPage()));
                        },
                        child: Text(
                          'Offers',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 10),
                child: Container(
                  color: Colors.deepOrange,
                  child: Text('New'),
                ),
              )
            ]),
          ),
        ],
      );
    }
  }

  changeColor() {
    if (_currentIndex == 0) {
      return Colors.deepOrange;
    } else if (_currentIndex == 1) {
      return Colors.blue;
    } else if (_currentIndex == 2) {
      return Colors.deepPurple;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: callAppBar(),
        backgroundColor: Colors.white,
        body: callPage(_currentIndex),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: changeColor(),
//              primaryColor: Colors.deepOrange,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))),
          child: BottomNavigationBar(
              elevation: 12,
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              items: <BottomNavigationBarItem>[
                new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  title: Text(
                    'Home',
                  ),
                ),
                new BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text('Search')),
                new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_mall,
                  ),
                  title: Text(
                    'Cart',
                  ),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  title: Text(
                    'Account',
                  ),
                ),
              ]),
        ));
  }
}
