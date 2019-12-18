import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List <Transaction> transactions =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenses'),),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart Area'),
            ),
          ),
          Card(
            child: Text('List of TX'),
          )
        ],
      ),
    );
  }
}