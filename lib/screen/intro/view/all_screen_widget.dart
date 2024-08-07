import 'package:flutter/material.dart';

class AllScreenWidget extends StatelessWidget {
  final String imageparam;
  final String text;

  const AllScreenWidget({
    super.key,
    required this.imageparam,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80, left: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imageparam, height: 300),
                const SizedBox(height: 150),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press here
              },
              child: const Text('Next'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8875FF),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 30,
                  ),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
        ],
      ),
    );
  }
}
