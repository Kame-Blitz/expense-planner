import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BarChart extends StatelessWidget {
  final String label;
  final double spendingAmt;
  final double percentOfTotal;

  BarChart(
      {required this.label,
      required this.spendingAmt,
      required this.percentOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child:
                FittedBox(child: Text('\$${spendingAmt.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: percentOfTotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ]),
        ),
        SizedBox(height: 4),
        FittedBox(
          child: Text(
            label,
          ),
        )
      ],
    );
  }
}
