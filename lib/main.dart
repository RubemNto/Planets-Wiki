import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

const List<String> planetNames = <String>[
  "Earth",
  "Jupiter",
  "Mars",
  "Mercury",
  "Neptune",
  "Saturn",
  "Uranus",
  "Venus"
];

const List<String> planetImages = <String>[
  'images/earth.svg',
  'images/jupiter.svg',
  'images/mars.svg',
  'images/mercury.svg',
  'images/neptune.svg',
  'images/saturn.svg',
  'images/uranus.svg',
  'images/venus.svg',
];
const String logo = 'images/astronaut.svg';
const List<double> gravity = <double>[
  9.8,
  26,
  3.75,
  3.61,
  13.3,
  11.2,
  10.5,
  8.83,
];
const List<double> oneDay = <double>[
  24,
  10,
  25,
  1.4,
  16,
  11,
  17,
  5.9,
];

const List<double> temperature = <double>[
  16,
  -108,
  -28,
  125,
  -201,
  -138,
  -195,
  471,
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Planets Wiki'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int planet = 0;

  void _planetIncrement() {
    setState(() {
      if (planet < planetNames.length - 1) {
        planet++;
        print(
          planet.toString(),
        );
      }
    });
  }

  void _planetDecrement() {
    setState(() {
      if (planet > 0) {
        planet--;
        print(
          planet.toString(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#000"),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25),
              child: SvgPicture.asset(
                logo,
                height: 50,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    HexColor("#431c52"),
                    HexColor("#310080"),
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      planetNames[planet],
                      style:
                          GoogleFonts.prompt(fontSize: 50, color: Colors.white),
                    ),
                  ),
                  Container(
                    child: SvgPicture.asset(
                      planetImages[planet],
                      width: 257,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: FlatButton(
                          onPressed: () {
                            _planetDecrement();
                          },
                          textColor: Colors.white,
                          child: Text(
                            "Before",
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: FlatButton(
                          onPressed: () {
                            _planetIncrement();
                          },
                          textColor: Colors.white,
                          child: Text(
                            "After",
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 37,
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.black.withAlpha(125),
                      borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                temperature[planet].toString() + "ºC",
                                style: GoogleFonts.prompt(
                                    fontSize: 40, color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Text(
                                oneDay[planet].toString() + "h",
                                style: GoogleFonts.prompt(
                                    fontSize: 40, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          //margin: EdgeInsets.only(top: 20),
                          child: Text(
                            gravity[planet].toString() + "m/s2",
                            style: GoogleFonts.prompt(
                                fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (press "p" in the console, choose the
      //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //     // to see the wireframe for each widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
