import 'dart:io';
import 'package:ecommerce/Firebase/firestore_helper.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreProvider extends ChangeNotifier {
  GlobalKey<FormState> categoryKey = GlobalKey();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  File? selectedImage;
  List<Category> categories = [];
  List<Product> products = [];

  FirestoreProvider() {
    getAllCategories();
  }

  selectImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }

  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "حقل مطلوب";
    }
  }

  getAllCategories() async {
    categories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  getAllProduct(String categoryId) async {
    products = await FirestoreHelper.firestoreHelper.getAllProduct(categoryId);
    notifyListeners();
  }
}
