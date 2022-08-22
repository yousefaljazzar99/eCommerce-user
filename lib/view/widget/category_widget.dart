import 'package:ecommerce/Provider/firestore_provider.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                    color: GreenColors,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
