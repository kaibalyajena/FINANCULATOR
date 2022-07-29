import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:financulator/models/Transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recent_trans;
  Chart(this.recent_trans);

  List<Map<String, Object>> get daily_trans {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      int total_sum = 0;
      for (var i = 0; i < recent_trans.length; i++) {
        if (recent_trans[i].date.day == weekDay.day &&
            recent_trans[i].date.month == weekDay.month &&
            recent_trans[i].date.year == weekDay.year) {
          total_sum += recent_trans[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay).toString());
      print(total_sum);
      return {"day": DateFormat.E().format(weekDay), 'amount': total_sum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(daily_trans);
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Row(children: []),
    );
  }
}
