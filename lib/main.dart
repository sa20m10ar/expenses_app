import './widgets/chart.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Expenses',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 void _startAddNewTransaction (BuildContext ctx){
    showModalBottomSheet(context: ctx,
    builder: (_){
      return GestureDetector(
        child: NewTransaction(_addNewTransaction) ,
        onTap: (){},
        behavior: HitTestBehavior.opaque ,
      );
     
    },);
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Personal Expenses'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed: ()=> _startAddNewTransaction(context),)
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
           Chart(_recentTransaction),
            TransactionList(_userTransactions,_deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: ()=> _startAddNewTransaction(context),),
    );

    }

 final List<Transaction>_userTransactions =[
      ];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx){
      return tx.date.isAfter(DateTime.now().
      subtract(Duration(days:7),
      ),
      );
    }).toList();
  }
   
  void _addNewTransaction (String txTitle , double txAmount,DateTime chosenDate){
 final newTx = Transaction(
  title: txTitle,
  amount: txAmount,
  date: chosenDate,
  id: DateTime.now().toString(),
);

setState(() {
  _userTransactions.add(newTx);
});
  }
  void _deleteTransaction(String id){
  setState(() {
  _userTransactions.removeWhere((tx){
    return tx.id == id ;
  });
});

}
}

