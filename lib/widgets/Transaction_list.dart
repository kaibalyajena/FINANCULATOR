import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  State<TransactionList> createState() => _Transaction_listState();
}

class _Transaction_listState extends State<TransactionList> {
  final List<Transaction> transactions = [
    Transaction(id: "1", title: "raquet", amount: 2800, date: DateTime.now()),
    Transaction(id: "2", title: "injection", amount: 450, date: DateTime.now()),
    Transaction(id: "3", title: "strap", amount: 1050, date: DateTime.now()),
    Transaction(id: "4", title: "specs", amount: 2200, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((tx) {
          return Card(
            color: Color(0xFFD9F8C4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 10,
            child: Row(children: [
              Container(
                margin:
                    EdgeInsets.only(right: 30, left: 15, top: 15, bottom: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF809A6F), width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  '₹${tx.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3CCF4E),
                      fontSize: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      tx.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Container(
                    child: Text(
                      DateFormat().add_yMMMd().format(tx.date),
                      style: TextStyle(color: Color(0xFF2B7A0B)),
                    ),
                  )
                ],
              )
            ]),
          );
        }).toList()
      ],
    );
  }
}
