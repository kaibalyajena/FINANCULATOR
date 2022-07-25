import 'package:financulator/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: "1", title: "raquet", amount: 2800, date: DateTime.now()),
    Transaction(id: "2", title: "injection", amount: 450, date: DateTime.now()),
    Transaction(id: "3", title: "strap", amount: 1050, date: DateTime.now()),
    Transaction(id: "4", title: "specs", amount: 2200, date: DateTime.now()),
  ];

  String titleinp = "";
  String amountinp = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF76BA99)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("FINANCULATOR"),
          backgroundColor: Color(0xFF76BA99),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: Color(0xFFC4DFAA),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "chart here",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              elevation: 7,
              margin: EdgeInsets.only(bottom: 30, top: 20, left: 10, right: 10),
            ),
            Card(
              elevation: 10,
              child: Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: "title"),
                          onChanged: (x) {
                            titleinp = x;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "amount"),
                          onChanged: (y) {
                            amountinp = y;
                          },
                        ),
                        FlatButton(
                            onPressed: () {}, child: Text("add transaction"))
                      ])),
            ),
            Column(
              children: [
                ...transactions.map((tx) {
                  return Card(
                    color: Color(0xFFD9F8C4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 15, top: 15, bottom: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF809A6F), width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
            )
          ],
        ),
      ),
    );
  }
}
