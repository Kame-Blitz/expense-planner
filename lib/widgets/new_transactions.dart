import 'package:flutter/material.dart';
import 'user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final Function? func;
  NewTransaction({this.func});
  final transactionNameController = TextEditingController();
  final transactionAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Transaction Name'),
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
                  func!(transactionNameController.text,
                      double.parse(transactionAmountController.text));
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
    );
  }
}
