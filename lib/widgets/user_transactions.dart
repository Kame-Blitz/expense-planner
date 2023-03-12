import 'package:flutter/material.dart';
import 'new_transactions.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  final List<Transaction> _transactions = [
    Transaction(
        amount: 0,
        dateCreated: DateTime.now(),
        transactionName: 'Transaction 1'),
    Transaction(
        amount: 0,
        dateCreated: DateTime.now(),
        transactionName: 'Transaction 2')
  ];
  void _addNew(String transactionName, double amount) {
    final newTx = Transaction(
        transactionName: transactionName,
        amount: amount,
        dateCreated: DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(func: _addNew), TransactionList(_transactions)],
    );
  }
}
