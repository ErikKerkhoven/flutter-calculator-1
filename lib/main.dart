import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:counter_app/methods.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _addText(String text) {
    setState(() {
      _controller.text += text;
    });
  }

  final TextEditingController _controller = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
              style: TextStyle(
                color: Colors.white,
              ),
              'Calculator app'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _controller.clear();
                    one = 0;
                    two = 0;
                  });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.none,
                    controller: _controller,
                    decoration: InputDecoration(hintText: one.toString()),
                  ),
                ),
                color:
                    Colors.grey[300], //switchen naar 300 om gelijk te trekken
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _addText('1');
                            },
                            child: Text('1')),
                        ElevatedButton(
                            onPressed: () {
                              _addText('2');
                            },
                            child: Text('2')),
                        ElevatedButton(
                            onPressed: () {
                              _addText('3');
                            },
                            child: Text('3')),
                        ElevatedButton(
                            onPressed: () {
                              _divideNumbers();
                            },
                            child: Text('/')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _addText('4');
                            },
                            child: Text('4')),
                        ElevatedButton(
                            onPressed: () {
                              _addText('5');
                            },
                            child: Text('5')),
                        ElevatedButton(
                            onPressed: () {
                              _addText('6');
                            },
                            child: Text('6')),
                        ElevatedButton(
                            onPressed: () {
                              _multiplyNumbers();
                            },
                            child: Text('*')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _addText('7');
                            },
                            child: Text('7')),
                        ElevatedButton(
                            onPressed: () {
                              _addText('8');
                            },
                            child: Text('8')),
                        ElevatedButton(
                            onPressed: () {
                              _addText('9');
                            },
                            child: Text('9')),
                        ElevatedButton(
                            onPressed: () {
                              _substractNumbers();
                            },
                            child: Text('-')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _addText('0');
                            },
                            child: Text('0')),
                        ElevatedButton(
                            onPressed: () {
                              _addText('.');
                            },
                            child: Text('.')),
                        ElevatedButton(
                          onPressed: () {
                            _changeTwo();
                            print('one is $one and two is $two');
                          },
                          child: Text('='),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[400]),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _addNumbers();
                            },
                            child: Text('+')),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double one = 0;
  double two = 0;

  Future<void> _changeOne() async {
    if (one == 0) {
      one = double.tryParse(_controller.text) ?? 0.0;
      _controller.clear();
      print('_changeOne is afgerond');
      setState(() {});
    }
  }

  Future<void> _changeTwo() async {
    if (one != 0) {
      two = double.tryParse(_controller.text) ?? 0.0;
      _controller.clear();
      print('_changeTwo is afgerond');
      setState(() {});
    }
  }

  Future<void> _addNumbers() async {
    await _changeOne();

    // Wacht tot two niet meer 0 is
    while (two == 0) {
      await Future.delayed(Duration(milliseconds: 100));
    }

    setState(() {
      one = one + two;
      two = 0;
    });
  }

  Future<void> _multiplyNumbers() async {
    await _changeOne();

    // Wacht tot two niet meer 0 is
    while (two == 0) {
      await Future.delayed(Duration(milliseconds: 1));
    }

    setState(() {
      one = one * two;
      two = 0;
    });
  }

  Future<void> _divideNumbers() async {
    await _changeOne();

    // Wacht tot two niet meer 0 is
    while (two == 0) {
      await Future.delayed(Duration(milliseconds: 100));
    }

    setState(() {
      one = one / two;
      two = 0;
    });
  }

  Future<void> _substractNumbers() async {
    await _changeOne();

    // Wacht tot two niet meer 0 is
    while (two == 0) {
      await Future.delayed(Duration(milliseconds: 100));
    }

    setState(() {
      one = one - two;
      two = 0;
    });
  }
}
