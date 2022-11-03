import 'package:flutter/material.dart';
import 'package:listview_modelclass/Grievance/GrievanceData.dart';

class Grievance_ListView extends StatelessWidget {
  const Grievance_ListView({super.key, required this.details});
  final ViewGrievances? details;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("id:  ${details?.id ?? 0}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("category:  ${details?.category ?? ""}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("assignedto:  ${details?.assignedto ?? ""}"),
          ),
        ],
      ),
    );
  }
}
