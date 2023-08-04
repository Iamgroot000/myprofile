import 'package:flutter/material.dart';

class SkillPage extends StatefulWidget {
  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _startScraping();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _startScraping() async {
    // Simulate scraping data asynchronously
    await Future.delayed(Duration(seconds: 2));

    // Once scraping is done, update the UI
    setState(() {
      // Update your UI elements here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your other UI elements here

              // Animated skill widget
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * 3.14159,
                    child: child,
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Flutter',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),

              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * 3.14159,
                    child: child,
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Dart',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),


SizedBox(height: 30,),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * 3.14159,
                    child: child,
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Firebase',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * 3.14159,
                    child: child,
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Scraping',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),


              // Display scraped data from Firebase

            ],
          ),
        ),
      ),
    );
  }
}
