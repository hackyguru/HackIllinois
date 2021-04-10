import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(1000, 750);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

const borderColor = Color(0xFF2E2F49);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WindowBorder(
                color: borderColor,
                width: 1,
                child: Row(children: [Splash()]))));
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool voxt = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 7)),
        builder: (c, s) => s.connectionState != ConnectionState.done
            ? Main() // Change to SplashScreen() after debugging so that the splash would appear lmao
            : Main());
  }
}

// Main screen

const backgroundStartColor = Color(0xFF2E2F49);
const backgroundEndColor = Color(0xFF2A2A41);

class Main extends StatelessWidget {
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
              children: [
                Column(children: [
                  WindowTitleBarBox(
                      child: Row(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 3, 3, 3),
                      child: GradientText(
                          text: "Rekindle",
                          colors: [Color(0xFFF15C4B), Colors.orange],
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: MoveWindow()),
                    WindowButtons()
                  ])),
                  // Body here
                  SizedBox(height: 30),
                  GradientText(
                      text: "Rekindle",
                      colors: [Colors.white, Colors.white],
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      children: [
                        Container(
                          width: 700,
                          height: 350,
                          color: Colors.black,
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                color: Colors.red,
                                height: 120,
                                width: 200,
                              )),
                        ),
                        SizedBox(width: 10),
                        Text("Insert here") // Face selection
                      ],
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,0,0),
                  child: Row(
                    children: [
                      LiteRollingSwitch(
                        //initial value
                        value: false,
                        textOn: 'On',
                        textOff: 'Off',
                        colorOn: Colors.greenAccent[700],
                        colorOff: Colors.redAccent[700],
                        iconOn: Icons.done,
                        iconOff: Icons.remove_circle_outline,
                        textSize: 20.0,
                        onChanged: (bool state) {
                          //Use it to manage the different states
                          print('Current State of SWITCH IS: $state');
                        },
                      ),
                    ],
                  ),
                )
              ],
            )));
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
