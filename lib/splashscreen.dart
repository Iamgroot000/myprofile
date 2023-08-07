


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myprofile/page1.dart';

import 'main.dart';

class MyCustomSplashScreen extends StatefulWidget {
@override
_MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
with TickerProviderStateMixin {
double _fontSize = 2;
double _containerSize = 1.5;
double _textOpacity = 0.0;
double _containerOpacity = 0.0;

late AnimationController _controller;
late Animation<double> animation1;

@override
void initState() {
super.initState();

_controller =
AnimationController(vsync: this, duration: Duration(seconds: 3));

animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
..addListener(() {
setState(() {
_textOpacity = 1.0;
});
});

_controller.forward();

Timer(Duration(seconds: 2), () {
setState(() {
_fontSize = 1.06;
});
});

Timer(Duration(seconds: 2), () {
setState(() {
_containerSize = 2;
_containerOpacity = 1;
});
});

Timer(Duration(seconds: 4), () {
setState(() {
//Navigator.pushReplacement(context, PageTransition(SecondPage()));
});
});
}

@override
void dispose() {
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
double _width = MediaQuery.of(context).size.width;
double _height = MediaQuery.of(context).size.height;

return Scaffold(
backgroundColor: Colors.deepPurple,
body: Stack(
children: [
Column(
children: [
AnimatedContainer(
duration: Duration(milliseconds: 2000),
curve: Curves.fastLinearToSlowEaseIn,
height: _height / _fontSize
),
AnimatedOpacity(
duration: Duration(milliseconds: 1000),
opacity: _textOpacity,
child: Text(
'MyProfile',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: animation1.value,
),
),
),
],
),
Center(
child: AnimatedOpacity(
duration: Duration(milliseconds: 2000),
curve: Curves.fastLinearToSlowEaseIn,
opacity: _containerOpacity,
child: AnimatedContainer(
duration: Duration(milliseconds: 2000),
curve: Curves.fastLinearToSlowEaseIn,
height: _width / _containerSize,
width: _width / _containerSize,
alignment: Alignment.center,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(30),
),
// child: Image.asset('assets/images/file_name.png')
child:
  OutlinedButton(
  style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
  // You can add more styles here as needed, like padding, shape, etc.
  ),
  onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Profile()), // Replace Profile() with your desired destination widget
  );
  },
  

 child: Container(
        height: 40,
  width: 300,
        decoration: BoxDecoration(
          color: Colors.yellow, // Set your desired background color
          borderRadius: BorderRadius.circular(20.0), // Set your desired border radius

        ),
  child: Center(child: Text('Visit MyProfile'))),
  ),



),
),
),

],
),
);
}
}



