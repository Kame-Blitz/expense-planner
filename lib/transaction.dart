class Transaction {
  int id = 0;
  final String transactionName;
  final double amount;
  final DateTime dateCreated;

  Transaction(
      {required this.transactionName,
      required this.amount,
      required this.dateCreated}) {
    id += 1;
  }
}
