import 'package:flutter/material.dart';
import 'package:flutter_provider_15092021/demo_basic_provider.dart';
import 'package:flutter_provider_15092021/demo_changenotifier.dart';
import 'package:flutter_provider_15092021/demo_proxy_provider.dart';
import 'package:flutter_provider_15092021/demo_valuelistenable_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Provider"),
        ),
        body: DemoProxyProvider(),
      ),
    );
  }
}