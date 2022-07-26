import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trans;
  final Function delete_transac;
  TransactionList(this.trans, this.delete_transac);
  @override
  Widget build(BuildContext context) {
    return trans.isEmpty
        ? Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "THERE ARE CURRENTLY NO TRANSACTIONS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 330,
                    child: Image.asset(
                      "assets/images/icon2.png",
                      fit: BoxFit.fill,
                    ))
              ],
            ),
          )
        : Container(
            height: (703),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Color(0xFF76BA99),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(top: 7, bottom: 7),
                      width: 130,
                      child: FittedBox(
                        child: Container(
                          margin: EdgeInsets.only(
                              right: 30, left: 15, top: 15, bottom: 15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 32, 80, 0),
                                  width: 4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            '₹${trans[index].amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 118, 14),
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 70,
                      child: FittedBox(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "${trans[index].title} cost",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              Container(
                                child: Text(
                                  DateFormat()
                                      .add_yMMMd()
                                      .format(trans[index].date),
                                  style: TextStyle(
                                      color: Color(0xFF2B7A0B),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(
                        onPressed: () => delete_transac(trans[index].id),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white60,
                        )),
                  ]),
                );
              },
              itemCount: trans.length,
            ),
          );
  }
}
