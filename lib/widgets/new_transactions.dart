import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        double.parse(transactionAmountController.text) <= 0 || selectedDate == null) {
      return;
    } else {
      widget.func(transactionNameController.text,
          double.parse(transactionAmountController.text), selectedDate);
    }
    Navigator.of(context).pop();
  }

  DateTime selectedDate = DateTime.now();

  void _datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((index) {
      if (index == null) {
        return;
      } else {
        setState(() {
          selectedDate = index;
        });
      }
    });
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
            Row(
              children: [
                Text(selectedDate == DateTime.now()
                    ? 'No date chosen'
                    : DateFormat.yMd().format(selectedDate)),
                TextButton(
                    onPressed: () {
                      _datepicker();
                    },
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ))
              ],
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
