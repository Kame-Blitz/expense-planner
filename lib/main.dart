import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

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
        amount: 0,
        dateCreated: DateTime.now(),
        transactionName: 'Transaction 1'),
    Transaction(
        amount: 0,
        dateCreated: DateTime.now(),
        transactionName: 'Transaction 2')
  ];
  final transactionNameController = TextEditingController();
  final transactionAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text(
                  'chart',
                  textAlign: TextAlign.center,
                ),
              )),
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Transaction Name'),
                    controller: transactionNameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    controller: transactionAmountController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          transactions.add(Transaction(
                              transactionName: transactionNameController.text,
                              amount: double.parse(
                                  transactionAmountController.text),
                              dateCreated: DateTime.now()));
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.purple)),
                      child: const Text(
                        'Add transaction',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: Column(
                  children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '₹ ${tx.amount}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.transactionName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.dateCreated),
                          style: const TextStyle(color: Colors.grey),
                        )
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
