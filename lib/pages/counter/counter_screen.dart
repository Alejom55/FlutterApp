import 'package:flutter/material.dart';

class ClickCounterApp extends StatefulWidget {
  const ClickCounterApp({super.key});

  @override
  _ClickCounterAppState createState() => _ClickCounterAppState();
}

class _ClickCounterAppState extends State<ClickCounterApp> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _resetCounter() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clicks counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Número de clics: $_count'),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.touch_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Touch me'),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _resetCounter,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Reset me'),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
