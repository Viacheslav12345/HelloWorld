import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          appBar: AppBar(
            elevation: 10,
            title: const Text('Hello world!'),
          ),
          body: const MainScreen(title: 'Hello world!'),
        ));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Color> ChangeColor = [
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.pink,
    Colors.blue,
    Colors.yellow
  ];

  int i = 0;

  void _changeColor() {
    setState(() {
      if (i < ChangeColor.length - 1) {
        i++;
      } else {
        i = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            // 'HelloWorld!',
            widget.title,
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: ChangeColor.elementAt(i)),
          ),
          const Text(
            'Натисни для зміни кольору:',
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsetsDirectional.all(10)),
                foregroundColor:
                    MaterialStateProperty.all(ChangeColor.elementAt(i))),
            onPressed: _changeColor,
            child: const Icon(
              Icons.color_lens,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
