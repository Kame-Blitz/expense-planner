class Transaction {
  final String id;
  final String transactionName;
  final double amount;
  final DateTime dateCreated;

  const Transaction(
      {required this.id,
      required this.transactionName,
      required this.amount,
      required this.dateCreated});
}
