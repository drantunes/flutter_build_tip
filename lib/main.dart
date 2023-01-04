import 'package:flutter/material.dart';
import 'package:flutter_build_tip/pages/drop_page.dart';
import 'package:flutter_build_tip/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Build Mais Eficiente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        // primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      // home: DropPage(),
    );
  }
}
