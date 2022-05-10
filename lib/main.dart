import 'package:demo_app_class/demo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/logic_model.dart';

void main() {
  if (kDebugMode) {
    runApp(const MyApp());
  } else {
    return _error();
  }
}

void _error() {
  Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Text(
        "Error",
        style: TextStyle(fontSize: 20),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const Inter(),
    );
  }
}

class Inter extends StatelessWidget {
  const Inter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogicModel(),
      child: const DemoBmi(),
    );
  }
}
