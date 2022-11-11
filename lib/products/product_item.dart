import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.productData});
  final Map productData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        product_row_component("Product Name", productData["productName"] ?? ""),
        product_row_component("Product Id", "${productData["productId"] ?? 0}"),
        product_row_component(
            "Product Description", productData["productDescrition"] ?? "")
      ]),
    );
  }

  Container product_row_component(String title, String value) {
    return Container(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [Text(title), Text(value)],
      ),
    );
  }
}


/*

sharedpref

userdefaults
plist


//key : value 
sqflite
hive

//DATABASE

write
read
delete
update



 */