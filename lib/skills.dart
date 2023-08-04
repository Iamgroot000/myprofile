import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class skillspage extends StatefulWidget {
  const skillspage({super.key});

  @override
  State<skillspage> createState() => _skillspageState();
}

class _skillspageState extends State<skillspage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Container(
            height: 40,
            width: 400,
            //color: Colors.white54,
            child: Center(

              child: Text(
                "My Skills!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.yellow,
                ),
              ),

            ),

          ),
          SizedBox(height: 40,),
          Container(
            height: 600,
            width: 400,
            //color: Colors.white54,
            child: Column(
              children: [
                AnimatedTopicGrid(
                  topic: "Flutter",
                  icon: Icons.smartphone,
                ),
                Row(
                  children: [
                    AnimatedTopicGrid(
                      topic: "Dart",
                      icon: Icons.code,
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedTopicGrid(
                      topic: "Firebase",
                      icon: Icons.fireplace,
                    ),
                  ],
                ),
                AnimatedTopicGrid(
                  topic: "Scraping",
                  icon: Icons.web,
                ),
              ],
            ),
          ),
    ]));
  }
}

class AnimatedTopicGrid extends StatefulWidget {
  final String topic;
  final IconData icon;

  AnimatedTopicGrid({required this.topic, required this.icon});

  @override
  _AnimatedTopicGridState createState() => _AnimatedTopicGridState();
}

class _AnimatedTopicGridState extends State<AnimatedTopicGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 50),
              SizedBox(height: 10),
              Text(widget.topic, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
            //color: Colors.yellow,














