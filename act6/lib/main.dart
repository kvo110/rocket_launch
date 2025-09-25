import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;

  // Decide text color based on counter value
  Color _getTextColor(int value) {
    if (value == 0) {
      return Colors.red; // when counter value is 0
    } else if (value > 50 && value < 100) {
      return Colors.green; // when counter value is between 50 and 100
    } else if (value == 100) {
      return Colors.purple; // when "LIFTOFF!" initiates 
    } else {
      return Colors.orange; // when counter value is between 1 and 50
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
//set up the widget alignement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              child: Text(
                //to displays current number
                _counter == 100 ? "LIFTOFF!" : '$_counter',
                style: TextStyle(
                  fontSize: 50.0,
                  color: _getTextColor(_counter), // dynamic text color
                ),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
