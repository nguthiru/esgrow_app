import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Esgrow",
      style: TextStyle(
          fontFamily: "SpaceGrotesk",
          fontWeight: FontWeight.bold,
          fontSize: 24),
    );
  }
}
