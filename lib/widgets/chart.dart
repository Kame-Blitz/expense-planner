import 'package:flutter/material.dart';

import 'package:no3/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:no3/widgets/bar_chart.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double sum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateCreated.day == weekday.day &&
            recentTransactions[i].dateCreated.month == weekday.month &&
            recentTransactions[i].dateCreated.year == weekday.year) {
          sum += recentTransactions[i].amount;
          print(recentTransactions[i]);
        }
      }
      return {
        'Day': DateFormat.E().format(weekday).substring(0, 1),
        'Amount': sum
      };
    });
  }

  Chart(this.recentTransactions);

  double get maxspending {
    return groupedTransactions.fold(0, (previousValue, element) {
      return previousValue + (element['Amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: BarChart(
                  label: e['Day'] as String,
                  spendingAmt: e['Amount'] as double,
                  percentOfTotal: maxspending == 0
                      ? 0
                      : (e['Amount'] as double) / maxspending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
