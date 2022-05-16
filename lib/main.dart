import 'package:flutter/material.dart';
import 'package:mcuapp/widgets/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color.fromARGB(255, 17, 17, 17),
        fontFamily: 'Proxima Nova',
      ),
      home: const MainScreen(),
    );
  }
}
