import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label ;
  final double spendingAmount;
  final double spendingPctOfTotal ;
   ChartBar(this.label,this.spendingAmount,this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 10,
          child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child:Stack(
            children: <Widget>[
              Container(decoration: BoxDecoration(
                border: Border.all(color :Colors.grey,
                width:1.0 ,),
                borderRadius:BorderRadius.circular(10) 
              ),),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(decoration: 
                BoxDecoration(color: Theme.of(context).primaryColor,
                borderRadius:BorderRadius.circular(10)
                ),
                ),
              )
            ],
          ) ,
        ),
        Text(label),
      ],
    );
  }
}