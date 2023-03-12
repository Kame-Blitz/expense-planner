import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function func;
  NewTransaction({required this.func});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final transactionNameController = TextEditingController();

  final transactionAmountController = TextEditingController();

  void submitData() {
    if (transactionNameController.text.isEmpty ||
        double.parse(transactionAmountController.text) <= 0) {
      return;
    } else {
      widget.func(transactionNameController.text,
          double.parse(transactionAmountController.text));
    }
    Navigator.of(context).pop();
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
