import 'package:flutter/material.dart';
import 'package:flutter_application_1/pro_mod.dart';
import 'package:flutter_application_1/pro_ser.dart';
import 'package:flutter_application_1/pro_det.dart';

// ignore: camel_case_types
class main extends StatefulWidget {
  const main({Key? key}) : super(key: key);

  @override
  State<main> createState() => _main();
}

class _main extends State<main> {
  bool isLoading = true;
  List<Product> productList = [];

  Future<void> getData() async {
    productList = await pro_ser.getProductsData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pro_det(
                                product: productList[index],
                              )),
                    );
                  },
                  child: ItemCard(
                    productName: productList[index].title ?? "--",
                    price: "${productList[index].price}",
                    thumbnail: productList[index].thumbnail ?? "",
                  ));
            },
          );
  }
}
