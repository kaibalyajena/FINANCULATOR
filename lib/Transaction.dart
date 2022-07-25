class Transaction {
  String id = "";
  String title = "";
  int amount = 0;
  DateTime date = DateTime.now();
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
