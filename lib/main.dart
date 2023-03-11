import 'package:flutter/material.dart';
import 'transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expense Tracker',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State {
  final List<Transaction> transactions = [
    Transaction(
        id: '1',
        amount: 0,
        dateCreated: DateTime.now(),
        transactionName: 'Transaction 1'),
    Transaction(
        id: '2',
        amount: 0,
        dateCreated: DateTime.now(),
        transactionName: 'Transaction 2')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text(
                  'hi',
                  textAlign: TextAlign.center,
                ),
              )),
          Container(
              width: double.infinity,
              child: Column(
                  children: transactions.map((tx) {
                return Card(
                    color: Colors.red,
                    child: Row(
                      children: [
                        Container(
                          child: Text('${tx.amount}'),
                        ),
                        Column(
                          children: [
                            Text(tx.transactionName),
                            Text('${tx.dateCreated}')
                          ],
                        )
                      ],
                    ));
              }).toList()))
        ],
      ),
    );
  }
}
