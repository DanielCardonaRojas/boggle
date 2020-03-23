import 'package:boggle/presentation/scenes/playing_scene.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boggle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlayingScene());
  }
}
