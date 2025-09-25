import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       // A widget that will be started on the application startup
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  
  Color _getTextColor(int value) {
    if (value == 0) {
      return Colors.red;
    } else if (value > 50 && value < 100) {
      return Colors.green;
    } else if (value == 100) {
      return Colors.purple;
    } else {
      return Colors.orange;
    }
  }

  
  void _checkLaunchSuccess() {
    if (_counter == 100) {
       // shows the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple[100],
            title: const Text(
              "Launch Successful!",
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.rocket_launch, size: 80, color: Colors.blueGrey),
                const SizedBox(height: 16),
                const Text(
                  "Congratulations! Your rocket has successfully launched!",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();// closes the dialog
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter display
            Center(
              //set up the widget alignement
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  //to displays current number
                  _counter == 100 ? "LIFTOFF!" : '$_counter',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: _getTextColor(_counter), // dynamic text color
                  ),
                ),
              ),
            ),

            // Slider
            Slider(
              min: 0,
              max: 100,
              value: _counter.toDouble(),
              onChanged: (double value) {
                setState(() {
                  _counter = value.toInt();
                  _checkLaunchSuccess();
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.red,
            ),

            const SizedBox(height: 20),

            // IGNITE Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_counter < 100) {
                    _counter++;
                    _checkLaunchSuccess();
                  }
                });
              },
              child: const Text("Ignite"),
            ),

            const SizedBox(height: 10),

            // ABORT + RESET Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_counter > 0) _counter--;
                    });
                  },
                  child: const Text("Abort"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  child: const Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
