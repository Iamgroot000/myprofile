import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprofile/projects.dart';
import 'package:myprofile/skills.dart';
import 'package:myprofile/whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Experincepage.dart';
import 'Qualification.dart';



class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        Container(
          color: Colors.black
          ,
          child: Column(
            children: [
              Container(
                height:600,
                width: 400,
               // color: Colors.white,
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
                                MaterialPageRoute(builder: (context) => MyexperienceApp  ()), // Replace SecondScreen() with your desired screen widget
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

                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 160,
                            child: ElevatedButton(
                              onPressed: () { Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  MyqualificationApp  ()), // Replace SecondScreen() with your desired screen widget
                              );},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              ),
                              child: Text("Qualifications "),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


              ),





    // Stack(
              //   children: [
              //     Row(
              //       children: [
              //         Align(
              //           alignment: Alignment.bottomRight,
              //           child: Container(
              //             height: 100,
              //             width: 100,
              //             color: Colors.green,
              //           ),
              //         ),
              //         // Add other widgets to the Column if needed
              //       ],
              //     ),
              //     // Add other Stack children if needed
              //   ],
              // )

            ],),
        ),
        Positioned(
          bottom: 0, // Aligns the bottom edge of the child to the bottom edge of the Stack
          right: 100,  // Aligns the right edge of the child to the right edge of the Stack
          child: Container(
            height: 240,
            width: 200,
            child: RadialMenu(
    children: [
      ///button which is in bottom center ,
      RadialButton(
        icon: Icon(Icons.facebook),
        buttonColor: Colors.blue,
        onPress: () {
          _showUrlDialog(context, _launchURL);
        },
      ),

      /// call features
      RadialButton(
        icon: Icon(Icons.phone),
        buttonColor: Colors.green,
        onPress: () {
          _showPhoneNumberDialog(context);
        },
      ),

      RadialButton(
    icon: Icon(Icons.ac_unit),
    buttonColor: Colors.teal,
    onPress: () {
    RadialButton(
    icon: Icon(Icons.whatshot),
    buttonColor: Colors.yellow,
    onPress: () { Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  MychatApp ()));},);},),
    ]
    ),
    ),
    ),
    ]);








  }
}
/// function for url , which we are calling in radial button,
void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
/// add your number with the call icon , it is calling in phone icon
void _launchPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch phone call';
  }
}

void _showPhoneNumberDialog(BuildContext context) {
  TextEditingController _phoneNumberController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Enter Phone Number'),
        content: TextField(
          controller: _phoneNumberController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: 'Phone Number'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              String phoneNumber = _phoneNumberController.text;
              Navigator.of(dialogContext).pop();
              _launchPhoneCall(phoneNumber);
            },
            child: Text('Call'),
          ),
        ],
      );
    },
  );
}

void _showUrlDialog(BuildContext context, Function(String) launchUrlCallback) {
  TextEditingController _urlController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Enter URL'),
        content: TextField(
          controller: _urlController,
          decoration: InputDecoration(labelText: 'URL'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              String url = _urlController.text;
              Navigator.of(dialogContext).pop();
              launchUrlCallback(url);
            },
            child: Text('Open'),
          ),
        ],
      );
    },
  );
}






