//image, name, gender, dob, team name, role, runs, country

import 'package:flutter/material.dart';

class CreateCricketers extends StatefulWidget {
  const CreateCricketers({super.key});

  @override
  State<CreateCricketers> createState() => _CreateCricketersState();
}

class _CreateCricketersState extends State<CreateCricketers> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Cricketers"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
            margin: const EdgeInsets.symmetric(vertical: 12.0),
              child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
              ),
            ),
          ],
        )),
    );
  }
}