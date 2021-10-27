import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person{
  late String name;
  late int age;

  Person({required this.name , required this.age});
}

class DemoBasicProvider extends StatefulWidget {

  @override
  _DemoBasicProviderState createState() => _DemoBasicProviderState();
}

class _DemoBasicProviderState extends State<DemoBasicProvider> {

  @override
  Widget build(BuildContext context) {
    return Provider(
      create:  (context) => Person(name: "Nguyen Van A" , age: 10),
      child: Center(
        child: Column(
          children: [
            TextName(),
            TextAge()
          ],
        ),
      ),
    );
  }
}

class TextName extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Person person = context.read();
    return Text(person.name);
  }
}

class TextAge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Person>(
      builder: (context , person , child){
        return Text(person.age.toString());
      },
    );
  }
}
