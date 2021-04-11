import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:fswitch/fswitch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:floatingpanel/floatingpanel.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(1000, 680);
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
            child: Row(
              children: [Splash()],
            )),
      ),
    );
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
                      padding: EdgeInsets.fromLTRB(15, 3, 3, 3),
                      child: Row(
                        children: [
                          GradientText(
                              text: "Rekindle",
                              colors: [Color(0xFFF15C4B), Colors.orange],
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(child: MoveWindow()),
                    WindowButtons()
                  ])),
                  // Body here
                ]),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => new AlertDialog(
                                backgroundColor: Colors.grey.withOpacity(0.95),
                                title: new Text('Disclaimer'),
                                content: Container(
                                  height: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Rekindle is an open-source and free-to-use deep faking tool developed at'),
                                      Text(
                                          'Hack Illinois 2021. We expect the users to use our tool for fair purposes.'),
                                      Text(
                                          'We are not responsible for any consequences that you face by using Rekindle.'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(); // dismisses only the dialog and returns nothing
                                    },
                                    child: new Text(
                                      'OK',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xFFF15C4B)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.help,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => new AlertDialog(
                                backgroundColor: Colors.grey.withOpacity(0.95),
                                title: new Text('FAQ'),
                                content: Container(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'How to use Rekindle?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Select a face from the faces section and you will find the image deepfaked in real time.'),
                                      Text(
                                          'A detailed guide is available at github.com/hackyguru/HackIllinois.'),
                                      SizedBox(height: 20),
                                      Text(
                                        'Is Rekindle open source?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Yes, Rekindle is open source :) feel free to contribute!'),
                                      SizedBox(height: 20),
                                      Text(
                                        'Are there dependencies?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Rekindle needs OBS Studio and Python 3 to be installed on your machine.'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(); // dismisses only the dialog and returns nothing
                                    },
                                    child: new Text(
                                      'OK',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xFFF15C4B)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 20, 40, 20),
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
                        Carousal()
                      ],
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          // Virtual camera
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      FSwitch(
                                        color: Colors.red,
                                        openColor: Colors.green,
                                        width: 150.0,
                                        height: 35.538,
                                        onChanged: (v) {},
                                        closeChild: Text(
                                          "Virtual camera off",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        openChild: Text("Virtual camera on",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                      SizedBox(height: 15),
                                      Text("Enable to use zoom/ gmeet etc.",
                                          style: GoogleFonts.poppins(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),

                          // Face crop
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      FSwitch(
                                        color: Colors.red,
                                        openColor: Colors.green,
                                        width: 150.0,
                                        height: 35.538,
                                        onChanged: (v) {},
                                        closeChild: Text(
                                          "Face cropping off",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        openChild: Text("Face cropping on",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                      SizedBox(height: 15),
                                      Text("Automatic face cropping",
                                          style: GoogleFonts.poppins(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),

                          // Flip video
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            Icons.flip,
                                            color: Colors.white,
                                          ),
                                          onPressed: null),
                                      SizedBox(height: 15),
                                      Text("Flip video",
                                          style: GoogleFonts.poppins(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50),
                          // What is Rekindle
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GradientText(
                                    text: "What is Rekindle?",
                                    colors: [Color(0xFFF15C4B), Colors.orange],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rekindle is a deep faking tool which enables you to",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.6)),
                                      ),
                                      Text(
                                        "visualize yourself as a person whom you miss. Rekindle",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.6)),
                                      ),
                                      Text(
                                        "aims in using deep faking for good!",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.6)),
                                      )
                                    ])
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Made with",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Colors.white.withOpacity(0.6)),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.favorite,
                    size: 14,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "at Hack Illinois 2021",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Colors.white.withOpacity(0.6)),
                  )
                ])
              ],
            )));
  }
}

class Carousal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: CarouselSlider(
          items: [
            Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 115,
                  backgroundImage: AssetImage("assets/Images/musk.png"),
                )),
            Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 115,
                  backgroundImage: AssetImage('assets/Images/obama.jpg'),
                )),
            Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 115,
                    backgroundImage: AssetImage(
                      'assets/Images/gandhi.jpg',
                    ))),
            Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 115,
                  backgroundImage: AssetImage('assets/Images/trump.png'),
                ))
          ],
          //Slider Container properties
          options:
              CarouselOptions(autoPlay: false, scrollDirection: Axis.vertical),
        ),
      ),
    );
  }
}
//Hello this is just a minor upgrade

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
