import 'package:flutter/material.dart';

class Quiz_Home_Screen extends StatelessWidget {
  const Quiz_Home_Screen({required this.changeScreen, super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: Color.fromARGB(155, 255, 255, 255),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Let's Learn Flutter",
            style: TextStyle(color: Colors.white, fontSize: 38.0),
          ),
          SizedBox(
            height: 30.0,
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_forward), label: Text('Start'),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 140, 103, 180)),
            onPressed: changeScreen,
            //child: Text('Start'),
          ),
        ],
      ),
    );
  }
}
