import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {


   final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

void _submitData(){
  if(_amountController.text.isEmpty){
    return;
  }
   final enteredTitle = _titleController.text;
   final enteredAmount = double.parse(_amountController.text);

 if(enteredTitle.isEmpty || enteredAmount<=0 || _selectedDate == null){
   return;
 }
   widget.addTx(
     enteredTitle,
     enteredAmount,
     _selectedDate
   ); 
   Navigator.of(context).pop();
}


void _presentDatePicker (){
  showDatePicker(context: context,initialDate: DateTime.now(),
  firstDate: DateTime(2019),lastDate: DateTime.now()).then((pickedDate){
  if(pickedDate==null){
    return;
  }
 setState(() {
    _selectedDate = pickedDate;
 });

  });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title',),
                    controller: _titleController,
                    onSubmitted:(_) => _submitData (),

                                     ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                     keyboardType: TextInputType.number,
                     onSubmitted:(_) => _submitData() ,
                  ),
                  Container(
                        height: 80,
                    child: Row(children: <Widget>[
                      Expanded(
                                              child: Text(_selectedDate == null ? 'No Date Chosen!' :
                        DateFormat.MMMEd().format(_selectedDate),),
                      ),
                      FlatButton(
                        child: Text('choose Date',
                        style:TextStyle(
                          color: Colors.red
                        ),
                        ),
                        onPressed: _presentDatePicker,
                      )
                    ],),
                  ),
                  FlatButton(
                    child: Text('Add Transaction',style:TextStyle(
                          color: Colors.white
                        ),
                        ),
                        color: Colors.red,
                    onPressed: _submitData,
                  )
                ], 
              ),
            ),
          );
  }
}