import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DemoFutureProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureProvider<int>(
      create: (context) => Future.delayed(Duration(seconds: 2),() => 2),
      initialData: 0,
      builder: (context , child){
        return Consumer<int>(
          builder: (context , value , child){
            return Text(value.toString());
          },
        );
      },
      updateShouldNotify: (previous,current){
        if (current % 2 == 0){
          return true;
        }
        return false;
      },
    );
  }
}