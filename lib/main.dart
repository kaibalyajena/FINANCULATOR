import 'package:financulator/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:financulator/widgets/new_transaction.dart';
import 'package:financulator/models/Transaction.dart';
import 'package:financulator/widgets/Transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String titleinp = "";
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

  void help() {
    print("hello");
  }

  void view_add_new_trans(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(newTrans);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF76BA99)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("FINANCULATOR"),
          backgroundColor: Color(0xFF76BA99),
          actions: [
            Builder(
                builder: (context) => IconButton(
                    onPressed: () => {view_add_new_trans(context)},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    )))
          ],
          // actions: [
          //   IconButton(
          //       onPressed: () => {view_add_new_trans(context)},
          //       icon: Icon(
          //         Icons.add,
          //         color: Colors.white,
          //       ))
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                color: Color(0xFF76BA99),
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
                margin:
                    EdgeInsets.only(bottom: 30, top: 20, left: 10, right: 10),
              ),
              TransactionList(transactions)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => {view_add_new_trans(context)},
                  backgroundColor: Colors.white70,
                  foregroundColor: Color(0xFF76BA99),
                  elevation: 30,
                )),
      ),
    );
  }
}
