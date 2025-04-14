import 'package:flutter/material.dart';

void main() {
  runApp(ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorChanger(),
    );
  }
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  int colorIndex = 0;
  int alignmentIndex = 0;

  final List<Map<String, dynamic>> colors = [
    {
      "colors": [
        Colors.green,
        Colors.white,
        Colors.green,
      ],
      "name": "Green",
    },
    {
      "colors": [
        Colors.blue,
        Colors.white,
        Colors.blue,
      ],
      "name": "Blue",
    },
    {
      "colors": [
        Colors.red,
        Colors.white,
        Colors.red,
      ],
      "name": "Red",
    },
  ];

  final List<List<Alignment>> colorAlignment = [
    [Alignment.topCenter, Alignment.bottomCenter],
    [Alignment.topRight, Alignment.bottomLeft],
    [Alignment.centerRight, Alignment.centerLeft],
    [Alignment.topLeft, Alignment.bottomRight],
  ];

  void changeColor() {
    setState(() {
      colorIndex = (colorIndex + 1) % colors.length;
    });
  }

  void changeDirection() {
    setState(() {
      alignmentIndex = (alignmentIndex + 1) % colorAlignment.length;
    });
  }

  String direction() {
    switch (alignmentIndex) {
      case 0:
        return "Horizontal";
      case 1:
        return "right-left";
      case 2:
        return "vertical";
      case 3:
        return "left-right";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: colorAlignment[alignmentIndex][0],
            end: colorAlignment[alignmentIndex][1],
            colors: colors[colorIndex]["colors"],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: changeColor,
                child: Text("Change Color"),
              ),
              SizedBox(height: 10),
              Text(
                "Red: ${colors[colorIndex]["colors"][0].red} "
                "Green: ${colors[colorIndex]["colors"][0].green} "
                "Blue: ${colors[colorIndex]["colors"][0].blue}",
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeDirection,
                child: Text("Change Direction"),
              ),
              SizedBox(height: 10),
              Text("Direction: ${direction()}"),
            ],
          ),
        ),
      ),
    );
  }
}

