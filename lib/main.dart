import 'package:flutter/material.dart';
import 'package:no3/widgets/chart.dart';
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

  List<Transaction> get _recenttransactions {
    return _transactions.where((tx) {
      return tx.dateCreated.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNew(String transactionName, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        transactionName: transactionName,
        amount: amount,
        dateCreated: chosenDate);
    setState(() {
      _transactions.add(newTx);
    });
  }

  void deleteTransaction(DateTime id) {
    setState(() {
      _transactions.removeWhere((tx) {
        return tx.id == id;
      });
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
          Chart(_recenttransactions),
          Expanded(child: TransactionList(_transactions, deleteTransaction)),
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
