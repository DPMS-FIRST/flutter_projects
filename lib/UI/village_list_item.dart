import 'package:first_app/UI/village_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VillageListItem extends StatelessWidget {
  const VillageListItem({super.key, required this.details});
  final VillagDetails? details;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("VillageId:  ${details?.villageId ?? 0}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("VillageName:  ${details?.villageName ?? ""}"),
          ),
          // Text("VillageId:  ${details?.villageId ?? 0}"),
          // Text("VillageId:  ${details?.villageId ?? 0}"),
        ],
      ),
    );
  }
}
