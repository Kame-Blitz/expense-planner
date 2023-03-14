import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deltx;
  TransactionList(this.transactions, this.deltx);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 20),
                    child: SizedBox(
                      height: 50,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'No Transactions Added Yet',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              )
            : ListView(
                children: transactions.map((tx) {
                return Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '₹ ${tx.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.transactionName,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.dateCreated),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        print(tx.id);
                        deltx(tx.id);
                      },
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ));
              }).toList()));
  }
}
