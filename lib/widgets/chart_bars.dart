import 'dart:ffi';

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String day = '';
  int day_amount = 0;
  double percent_of_tamount = 0;
  ChartBar(this.day, this.day_amount, this.percent_of_tamount);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('₹${day_amount}'),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: Color.fromARGB(247, 177, 220, 133),
                  borderRadius: BorderRadius.circular(20)),
            ),
            FractionallySizedBox(
              heightFactor: percent_of_tamount,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 5,
        ),
        Text(day)
      ],
    );
  }
}
