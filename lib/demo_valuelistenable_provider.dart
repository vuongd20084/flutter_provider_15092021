import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Count{
  late ValueNotifier<int> valueNotifier = ValueNotifier(0);

}

class DemoValuelistenableProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Count(),
      child: Consumer<Count>(
        builder: (context , count , child){
          return ValueListenableProvider.value(
            value: count.valueNotifier,
            child:  Consumer<int>(
                builder: (context , value , child){
                  return Container(
                    constraints: BoxConstraints.expand(),
                    child: Center(
                      child: Column(
                        children: [
                          Text(value.toString()),
                          ElevatedButton(onPressed: (){
                            count.valueNotifier.value += 1;
                          }, child: Text("Increase"))
                        ],
                      ),
                    ),
                  );
                }
            ) ,
          );
        },
      ),
    );
  }
}