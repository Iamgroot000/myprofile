import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprofile/projects.dart';
import 'package:myprofile/skills.dart';

import 'Qualification.dart';



class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black
      ,
      child: Column(
        children: [
          Container(
            height:600,
            width: 400,//color: Colors.white,
            child: SingleChildScrollView( // Wrap with SingleChildScrollView
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25,),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/gaurav.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gaurav Parmar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SkillPage ()), // Replace SecondScreen() with your desired screen widget
                          );},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text("Skills"),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 10),
                  // Divider(  // Add a divider line here
                  //   color: Colors.blueAccent,
                  //   height: 20,
                  //   thickness: 1,
                  //   indent: 30,
                  //   endIndent: 30,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SlideAnimation1  ()), // Replace SecondScreen() with your desired screen widget
                          );},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text("Experince"),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MyprojectApp  ()), // Replace SecondScreen() with your desired screen widget
                          );},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text("Projects "),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ),

        ],
      ),
    );
  }
}
