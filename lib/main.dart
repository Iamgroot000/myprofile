import 'package:flutter/material.dart';
import 'package:myprofile/page1.dart';
import 'package:myprofile/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(

      body: Center(
        child: MyCustomLoginUI(),
      ),
    ),
  ));
}


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);


  @override
  State<Profile> createState() => _ProfileState();
}
/// use for animation for Gaurav parmar
class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(''), // Replace with the actual path to your image
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),




            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/gaurav.jpg'),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'Gaurav Parmar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => page1()), // Replace SecondScreen() with your desired screen widget
                      );
                    },
                    child: Text("Let's go"),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

