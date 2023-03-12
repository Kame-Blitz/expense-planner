import 'package:flutter/material.dart';
import 'package:no3/widgets/user_transactions.dart';
import 'widgets/new_transactions.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'chart',
                  textAlign: TextAlign.center,
                ),
              )),
          UserTransactions(),
        ],
      ),
    );
  }
}
