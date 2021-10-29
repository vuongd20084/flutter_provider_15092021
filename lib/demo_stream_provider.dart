import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DemoStreamProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>(
      create: (_) => Stream.periodic(Duration(seconds: 1), (data) => data),
      initialData: 0,
      builder: (context,child){
        return Consumer<int>(
          builder: (context , value , child){
            return Text(value.toString());
          },
        );
      },
    );
  }
}