import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function add_trans_func;
  NewTransaction(this.add_trans_func);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title_controller = TextEditingController();

  final amount_controller = TextEditingController();

  DateTime trans_date = DateTime(1900);

  void submit_trans() {
    final title_text = title_controller.text;
    final amount_text = int.parse(amount_controller.text);
    if (title_text.isEmpty ||
        amount_text <= 0 ||
        trans_date == DateTime(1900)) {
      return;
    }
    widget.add_trans_func(
        title_controller.text, int.parse(amount_controller.text), trans_date);
    Navigator.of(context).pop();
  }

  void showDatePickeron() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2003),
            lastDate: DateTime(2100))
        .then((chosen_date) {
      if (chosen_date == null) {
        return;
      }
      setState(() {
        trans_date = (chosen_date as DateTime);
      });
    });
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
            Container(
              height: 80,
              child: Row(
                children: [
                  Text(trans_date == DateTime(1900)
                      ? "No date chosen"
                      : DateFormat().add_yMMMd().format(trans_date)),
                  FlatButton(
                      onPressed: showDatePickeron,
                      child: Text(
                        "choose date",
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submit_trans,
              child: Text(
                "add transaction",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ])),
    );
  }
}
