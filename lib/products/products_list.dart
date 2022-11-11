import 'dart:convert';

import 'package:first_app/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products list")),
      body: Container(
          child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final productData = list[index];
          return ProductListItem(productData: productData);
        },
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTheProductsData();
  }

  fetchTheProductsData() async {
    String data = await rootBundle.loadString('assets/billing.json');
    final jsonResult = json.decode(data);
    setState(() {
      list = jsonResult["data"];
    });
    print("products list $jsonResult");
  }
}
