import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:financulator/models/Transaction.dart';
import 'package:intl/intl.dart';
import 'package:financulator/widgets/chart_bars.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recent_trans;

  Chart(this.recent_trans);

  List<Map<String, Object>> get daily_trans {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      num total_sum = 0;
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
    }).reversed.toList();
  }

  double get max_amount {
    return daily_trans.fold(0.0, (sum, item) {
      return sum + (item['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(daily_trans);
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(20),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: daily_trans.map((data) {
            // return Text('hello');
            return ChartBar((data['day'] as String), (data['amount'] as int),
                ((data['amount'] as int) / max_amount).toDouble());
          }).toList(),
        ),
      ),
    );
  }
}
