import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trans;
  TransactionList(this.trans);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (670),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: Color(0xFF76BA99),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 10,
            child: Row(children: [
              Container(
                margin:
                    EdgeInsets.only(right: 30, left: 15, top: 15, bottom: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 32, 80, 0), width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  '₹${trans[index].amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 118, 14),
                      fontSize: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      trans[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Container(
                    child: Text(
                      DateFormat().add_yMMMd().format(trans[index].date),
                      style: TextStyle(
                          color: Color(0xFF2B7A0B),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          );
        },
        itemCount: trans.length,
      ),
    );
  }
}
