import 'package:financulator/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // String titleinp = "";
  // String amountinp = "";

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
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
