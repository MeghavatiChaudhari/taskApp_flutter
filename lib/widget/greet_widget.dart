import 'package:flutter/material.dart';

class GreetWidget extends StatelessWidget {
  const GreetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(width: 8),
            Text(
              'Hi, user',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white54,
              ),
            ),
          ],
        ),
        SizedBox(height: 8), // Adjust the spacing as needed
        Text(
          'Stay focused and achieve your goals!',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
