class Transaction {
  DateTime id = DateTime.now();
  final String transactionName;
  final double amount;
  final DateTime dateCreated;

  Transaction(
      {required this.transactionName,
      required this.amount,
      required this.dateCreated}) {
    id = DateTime.now();
  }
}
