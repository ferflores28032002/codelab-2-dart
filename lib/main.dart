import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Inherited Widgets Example')),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: counter,
      increment: () {
        setState(() {
          counter++;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterText(),
          IncrementButton(),
        ],
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int counter;
  final Function increment;

  CounterProvider({required this.counter, required this.increment, required Widget child}) : super(child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Text('Counter: ${provider!.counter}', style: TextStyle(fontSize: 24));
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return ElevatedButton(
      onPressed: () => provider!.increment(),
      child: Text('Increment'),
    );
  }
}
