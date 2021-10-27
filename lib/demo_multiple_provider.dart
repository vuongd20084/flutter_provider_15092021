import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Counter1 {
  late int index;

  Counter1({required this.index});
}
class Counter2 {
  late int index;

  Counter2({required this.index});
}

class DemoMultipleProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Counter1(index: 10)),
        Provider(create: (context) => Counter2(index: 20)),
      ],
      child: Column(
        children: [
          Consumer<Counter1>(
            builder: (context , counter1 , child){
              return Text(counter1.index.toString());
            },
          ),
          Consumer<Counter2>(
            builder: (context , counter2 , child){
              return Text(counter2.index.toString());
            },
          )
        ],
      ),
    );
  }
}