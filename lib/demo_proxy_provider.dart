import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Counter extends ChangeNotifier{
  late int _count;
  set count(int count){
    _count = count;
    notifyListeners();
  }
  int get count => _count;

  Counter(int count) {
    _count = count;
  }



}

class CounterApi extends ChangeNotifier{
  late Counter counter;

  CounterApi();

  void updateCounter(Counter counter){
    this.counter = counter;
    notifyListeners();
  }
}

class CounterService extends ChangeNotifier{
  late CounterApi counterApi;

  CounterService();

  void updateCounterApi(CounterApi counterApi){
    this.counterApi = counterApi;
    notifyListeners();
  }
}

class DemoProxyProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter(0)),
        ChangeNotifierProxyProvider<Counter,CounterApi>(
          create: (context) => CounterApi(),
          update: (context , counter , counterApi){
            print("update counterApi");
            counterApi!.updateCounter(counter);
            return counterApi;
          },
        ),
        ChangeNotifierProxyProvider<CounterApi,CounterService>(
          create: (context) => CounterService(),
          update: (context , counterApi , counterService){
            print("update counterService");
            counterService!.updateCounterApi(counterApi);
            return counterService;
          },
        ),
      ],
      child: Consumer<CounterService>(
        builder: (context, counterService , child){
          return Column(
            children: [
              Text(counterService.counterApi.counter.count.toString()),
              ElevatedButton(onPressed: (){
                counterService.counterApi.counter.count +=1;
              }, child: Text("Click"))
            ],
          );
        },
      ),
    );
  }

}