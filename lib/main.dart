import 'package:flutter/material.dart';
import 'package:no3/widgets/new_transactions.dart';
import 'package:no3/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(headline6: TextStyle(fontSize: 16)),
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
              textTheme: ThemeData.light()
                  .textTheme
                  .copyWith(headline6: TextStyle(fontSize: 20)))),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [];

  void _addNew(String transactionName, double amount) {
    final newTx = Transaction(
        transactionName: transactionName,
        amount: amount,
        dateCreated: DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bcontext) {
          return GestureDetector(
            child: NewTransaction(func: _addNew),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
        ),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
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
          TransactionList(_transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
