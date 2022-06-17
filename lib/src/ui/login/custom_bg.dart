import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xffaeec53),
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepOrangeAccent],
                begin: Alignment.centerRight,
                end: Alignment(-1.0, -1.0))),
      ),
    );
  }
}
