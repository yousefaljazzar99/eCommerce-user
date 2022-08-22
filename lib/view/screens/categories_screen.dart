import 'package:ecommerce/Provider/auth_provider.dart';
import 'package:ecommerce/Provider/firestore_provider.dart';
import 'package:ecommerce/models/router.dart';
import 'package:ecommerce/view/screens/all_products_screen.dart';
import 'package:ecommerce/view/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, FirestoreProvider>(
        builder: (context, authProvider, firestoreProvider, x) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: GreenColors,
          title: Text("القوائم"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                authProvider.signOut();
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: firestoreProvider.categories.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: firestoreProvider.categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      firestoreProvider.getAllProduct(
                          firestoreProvider.categories[index].categoryId!);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => ProductsScreen(
                              firestoreProvider
                                  .categories[index].categoryId!))));
                    },
                    child: CategoryWidget(
                        category: firestoreProvider.categories[index]),
                  );
                },
              ),
      );
    });
  }
}
