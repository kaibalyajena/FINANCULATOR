import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final title_controller = TextEditingController();
  final amount_controller = TextEditingController();
  final Function add_trans_func;
  NewTransaction(this.add_trans_func);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: title_controller,
              // onChanged: (x) {
              //   titleinp = x;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "amount"),
              controller: amount_controller,
              // onChanged: (y) {
              //   amountinp = y;
              // },
            ),
            FlatButton(
                onPressed: () {
                  add_trans_func(
                      title_controller.text, int.parse(amount_controller.text));
                },
                child: Text("add transaction"))
          ])),
    );
  }
}
