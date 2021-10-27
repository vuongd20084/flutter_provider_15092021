import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Count extends ChangeNotifier{
  late int value;

  Count({required this.value});

  void increase(){
    value += 1;
    notifyListeners();
  }
}

class DemoChangeNotifier extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Count(value: 0),
      child: DemoWidget(),
    );
  }
}

class DemoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Count>(
      builder: (context, count , child){
        return Column(
          children: [
            Text("Count : ${count.value}"),
            ElevatedButton(
                onPressed: (){
                  count.increase();
                },
                child: Text("Increase count")
            )
          ],
        );
      },
    );
  }
}
