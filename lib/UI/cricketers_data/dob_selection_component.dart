import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class UserDobComponent extends StatelessWidget {
  const UserDobComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100),
              );
              print("selected date $selectedDate");

              userDob.value = selectedDate!;
            },
            child: Icon(Icons.calendar_month),
          ),
          ValueListenableBuilder(
            valueListenable: userDob,
            builder: (context, value, child) {
              // return Text(value ?? "");
              final date = DateFormat("yyyy/MM/dd").format(value);
              return Text(
                date,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              );
            },
          )
        ],
      ),
    );
  }
}
