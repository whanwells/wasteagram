import 'package:flutter/material.dart';
import 'screens/list_screen.dart';
import 'constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListScreen(),
    );
  }
}
