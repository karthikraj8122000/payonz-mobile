class Transaction {
  final String merchantName;
  final String date;
  final String description;
  final double amount;
  final String logo;

  Transaction({
    required this.merchantName,
    required this.date,
    required this.description,
    required this.amount,
    required this.logo,
  });
}