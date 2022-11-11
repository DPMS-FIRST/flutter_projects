import 'package:first_app/UI/cricketers_data/crickers_model.dart';
import 'package:flutter/material.dart';


class CricketerListItem extends StatelessWidget {
  const CricketerListItem({super.key, required this.details});
  final CrickertModel? details;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("userId:  ${details?.userId ?? ""}"),
          ), */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name:  ${details?.name ?? ""}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("DOB:  ${details?.dob ?? ""}"),
          ),
          /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("role:  ${details?.role ?? ""}"),
          ), */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("gender:  ${details?.gender ?? ""}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("country:  ${details?.country ?? ""}"),
          ),
          // Text("VillageId:  ${details?.villageId ?? 0}"),
          // Text("VillageId:  ${details?.villageId ?? 0}"),
         Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: (){
                      
                  }, 
                  icon: const Icon(
                    Icons.edit, 
                  color: Colors.teal,)
                  ),
                  IconButton(
                    onPressed: (){

                  }, icon: const Icon(
                    Icons.delete, 
                  color: Colors.red,))

                ],
              ),
        ],
      ),
    );
  }
}
/* 
Card(
            child: ListTile(
             
         
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){

                  }, 
                  icon: const Icon(
                    Icons.edit, 
                  color: Colors.teal,)
                  ),
                  IconButton(onPressed: (){

                  }, icon: const Icon(
                    Icons.delete, 
                  color: Colors.red,))

                ],
              ),
            ),
             
          );
         
 */