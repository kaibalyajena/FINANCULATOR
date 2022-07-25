import 'package:flutter/material.dart';
import 'package:financulator/widgets/Transaction_list.dart';
import 'package:financulator/widgets/new_transaction.dart';
import 'package:financulator/models/Transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(id: "1", title: "raquet", amount: 2800, date: DateTime.now()),
    Transaction(id: "2", title: "injection", amount: 450, date: DateTime.now()),
    Transaction(id: "3", title: "strap", amount: 1050, date: DateTime.now()),
    Transaction(id: "4", title: "specs", amount: 2200, date: DateTime.now()),
  ];

  void newTrans(String title, int amount) {
    final new_trans = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      transactions.add(new_trans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(newTrans),
        TransactionList(transactions),
      ],
    );
  }
}
