import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:flutter/material.dart';

class CounterApp extends StatelessWidget {
  CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: counter,
      builder: (context, value, child) {
        return Row(
          children: [
            TextButton(
                onPressed: () {
                  counter.value++;
                },
                child: Text(
                  "+",
                  style: TextStyle(fontWeight: FontWeight.w800),
                )),
            Text("counter value $value"),
            TextButton(
                onPressed: () {
                  counter.value--;
                },
                child:
                    Text("-", style: TextStyle(fontWeight: FontWeight.w800))),
          ],
        );
      },
    );
  }
}
