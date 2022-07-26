import 'package:flutter/material.dart';
import 'package:financulator/widgets/new_transaction.dart';
import 'package:financulator/models/Transaction.dart';
import 'package:financulator/widgets/Transaction_list.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:financulator/widgets/chart.dart';

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

  List<Transaction> get recent_transaction {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
    // for (var i = 0; i < transactions.length; i++) {
    //   final List<Transaction> x;
    //   if (transactions[i]
    //       .date
    //       .isAfter(DateTime.now().subtract(Duration(days: 7)))) {
    //     x.add(transactions[i]);
    //   }
    //   return x;
    // }
  }

  void newTrans(String title, int amount, DateTime transaction_date) {
    final new_trans = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: transaction_date);
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
          return GestureDetector(
            child: NewTransaction(newTrans),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void delete_trans(String id) {
    setState(() {
      transactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "expenditures",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Fredoka'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "FINANCULATOR",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
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
              transactions.isEmpty
                  ? Text("NO CHART DATA")
                  : recent_transaction.isEmpty
                      ? Text("NO RECENT TRANSACTION DATA AVAILABLE")
                      : Chart(recent_transaction),
              // Card(
              //   color: Color(0xFF76BA99),
              //   child: Container(
              //     width: double.infinity,
              //     child: Center(
              //       child: Text(
              //         "chart here",
              //         style: TextStyle(fontSize: 30),
              //       ),
              //     ),
              //   ),
              //   elevation: 7,
              //   margin:
              //       EdgeInsets.only(bottom: 30, top: 20, left: 10, right: 10),
              // ),
              TransactionList(transactions, delete_trans)
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
