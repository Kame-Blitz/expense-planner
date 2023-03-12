import 'package:flutter/material.dart';
import 'user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final Function? func;
  NewTransaction({this.func});
  final transactionNameController = TextEditingController();
  final transactionAmountController = TextEditingController();

  void submitData() {
    if (transactionNameController.text.isEmpty ||
        double.parse(transactionAmountController.text) <= 0) {
      return;
    } else {
      func!(transactionNameController.text,
          double.parse(transactionAmountController.text));
    }
  }

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
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Transaction Name'),
              controller: transactionNameController,
              onSubmitted: (_value) {
                submitData();
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: transactionAmountController,
              onSubmitted: (_value) {
                submitData();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OutlinedButton(
                onPressed: submitData,
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
