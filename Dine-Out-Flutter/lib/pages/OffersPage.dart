import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Align(
            alignment: Alignment.center,
            child: Text(
              'Offers',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            )));
  }
}
