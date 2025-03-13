class Bank {
  final String id;
  final String name;
  final String accountNumber;
  final String iconPath;

  Bank({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.iconPath,
  });
}

class BankDetails {
  final String bankName;
  final String bankImage;

  BankDetails({
    required this.bankName,
    required this.bankImage,
  });
}
