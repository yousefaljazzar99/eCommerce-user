import 'package:ecommerce/Provider/firestore_provider.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  String catId;
  ProductWidget({required this.product, required this.catId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: GreenColors,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
