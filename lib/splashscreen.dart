import 'package:google_fonts/google_fonts.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:lottie/lottie.dart';



const backgroundStartColor = Color(0xFF2E2F49);
const backgroundEndColor = Color(0xFF2A2A41);

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [backgroundStartColor, backgroundEndColor],
                  stops: [0.0, 1.0]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Lottie.asset("assets/people_flow.json"),
               SizedBox(height: 20),
               GradientText(text: "Rekindle", colors: [Color(0xFFF15C4B),Colors.orange], style: GoogleFonts.poppins(fontSize: 60, fontWeight: FontWeight.bold )),
               Text("Deep fakes for rekindling people", style: GoogleFonts.poppins(color: Colors.white))
            ])));
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: Color(0xFFF15C4B),
    mouseOver: Colors.white,
    mouseDown: Color(0xFFF15C4B),
    iconMouseOver: Color(0xFFF15C4B),
    iconMouseDown: Color(0xFFF15C4B));

final closeButtonColors = WindowButtonColors(
    mouseOver: Color(0xFFF15C4B),
    mouseDown: Color(0xFFF15C4B),
    iconNormal: Color(0xFFF15C4B),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}