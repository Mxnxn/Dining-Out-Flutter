import 'package:blemacion_app/pages/ForgetPasswordPage.dart';
import 'package:blemacion_app/pages/SigninPage.dart';
import 'package:flutter/material.dart';
import 'package:blemacion_app/styleguide/colors.dart';
import 'package:blemacion_app/styleguide/text-style.dart';

import 'package:blemacion_app/pages/LandingPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginPage createState() => _loginPage();
}

class _loginPage extends State<LoginPage> {
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
          child: Column(
            children: <Widget>[
              Text(
                'Dining Out',
                style: headingStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 70,
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
                            color: Colors.deepOrange,
                          ),
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16))),
                ),
              ),
              SizedBox(
                height: 20,
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
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock_open,
                            color: Colors.deepOrange,
                          ),
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(right: mWidth - 360),
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage()));
                    },
                    child: Text('Forgot Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange)),
                  )),
              SizedBox(
                height: mHeight / 8,
              ),
              Material(
                elevation: 13,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  width: mWidth - 200,
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4.0,
                    color: Colors.deepOrange,
                    splashColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LandingPage()));
                    },
                    child: Align(
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: Colors.white))),
                  ),
                ),
//                  color: Colors.deepOrange,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SigninPage()));
                    },
                    child: Text("Don't Have an Account? Signin",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blue)),
                  )),
            ],
          ),
        ));
  }
}
