import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final title_controller = TextEditingController();
  final amount_controller = TextEditingController();
  final Function add_trans_func;
  NewTransaction(this.add_trans_func);

  void submit_trans() {
    final title_text = title_controller.text;
    final amount_text = int.parse(amount_controller.text);
    if (title_text.isEmpty || amount_text <= 0) {
      return;
    }
    add_trans_func(title_controller.text, int.parse(amount_controller.text));
  }

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
              onSubmitted: (_) => {submit_trans()},
              // onChanged: (x) {
              //   titleinp = x;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "amount"),
              controller: amount_controller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => {submit_trans()},
              // onChanged: (y) {
              //   amountinp = y;
              // },
            ),
            FlatButton(onPressed: submit_trans, child: Text("add transaction"))
          ])),
    );
  }
}
