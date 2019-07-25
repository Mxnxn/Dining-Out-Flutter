import 'package:flutter/material.dart';
import 'package:blemacion_app/styleguide/colors.dart';
import 'package:blemacion_app/styleguide/text-style.dart';

import 'package:blemacion_app/pages/LandingPage.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPage createState() => _ForgetPasswordPage();
}

class _ForgetPasswordPage extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Material(child: LayoutBuilder(
      builder: (context, constraint) {
        final _height = constraint.maxHeight;
        final _width = constraint.maxWidth;

        return Stack(
          children: <Widget>[
            Container(
              color: backgroundColor,
            ),
            Positioned(
              left: -(_height / 2 - _width / 2),
              bottom: 80,
              child: Container(
                height: _height,
                width: _height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstCircleColor,
                ),
              ),
            ),
            Positioned(
              left: -(_height / 7 - _width / 7),
              bottom: 250,
              child: Container(
                height: _height,
                width: _height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondCircleColor,
                ),
              ),
            ),
            Positioned(
              left: -(_height / 7 - _width / 3),
              bottom: 400,
              child: Container(
                height: _height,
                width: _height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            elements(_height, _width),
          ],
        );
      },
    ));
  }

  Widget elements(mHeight, mWidth) {
//    double mH = mHeight / 2;

    return Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Align(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Text(
                'Dinning Out',
                style: headingStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15)]),
                width: mWidth - 50,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 15, left: 15),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16))),
                ),
              ),
              SizedBox(
                height: mHeight / 5.5,
              ),
              Material(
                  elevation: 15,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()));
                      },
                      child: Container(
                          height: 50,
                          width: mWidth / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Forget',
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ))))
            ])));
  }
}
