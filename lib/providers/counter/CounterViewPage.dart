
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_listview/providers/counter/CounterLogicPage.dart';

class CounterPageView extends StatelessWidget {
  const CounterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterStateProvider = Provider.of<CounterLogicPage>(context);
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter with Providers"),
        ),
        body: Column(
          children: [

            TextButton(
              onPressed: (){
                CounterStateProvider.increment();
            }, child: Text("+")),

            Text("Counter value ${CounterStateProvider.counter}"),
            
            TextButton(
              onPressed: (){
                CounterStateProvider.decrement();
            }, child: Text("-")),

          ],
        )
    );
  }
}