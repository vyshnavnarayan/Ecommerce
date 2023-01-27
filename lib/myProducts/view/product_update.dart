import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/add_product/repository/add_product_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProduct extends StatelessWidget {
  UpdateProduct({super.key, required this.product});
  late final TextEditingController _productNameController =
      TextEditingController(text: product['product_name'].toString());
  late final TextEditingController _productDescriptionController =
      TextEditingController(text: product['description'].toString());
  late final TextEditingController _productDetailsController =
      TextEditingController(text: product['product_details'].toString());
  late final TextEditingController _productPriceController =
      TextEditingController(text: product['product_price'].toString());
  late final TextEditingController _discountController =
      TextEditingController(text: product['discount'].toString());

  final QueryDocumentSnapshot<Map<String, dynamic>> product;

  // List<XFile>? images;

  // Future<void> getImage() async {
  //   final imagePicker = ImagePicker();
  //   images = await imagePicker.pickMultiImage();
  // }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field can't be null";
                    }
                  },
                  controller: _productNameController,
                  decoration: InputDecoration(
                      labelText: 'Product Name',
                      labelStyle:
                          TextStyle(fontSize: 13, color: Colors.redAccent),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field can't be null";
                    }
                  },
                  controller: _productDescriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: 'Product Description',
                      labelStyle:
                          TextStyle(fontSize: 13, color: Colors.redAccent),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Product description',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field can't be null";
                    }
                  },
                  controller: _productDetailsController,
                  decoration: InputDecoration(
                      labelText: 'Product Details',
                      labelStyle:
                          TextStyle(fontSize: 13, color: Colors.redAccent),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Product Details',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field can't be null";
                    }
                  },
                  controller: _productPriceController,
                  decoration: InputDecoration(
                      labelText: 'Product Price',
                      labelStyle:
                          TextStyle(fontSize: 13, color: Colors.redAccent),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Product Price',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextFormField(
                  controller: _discountController,
                  decoration: InputDecoration(
                    labelText: 'Discount',
                    labelStyle:
                        TextStyle(fontSize: 13, color: Colors.redAccent),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Discount %',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addProductRepo().updateProduct(
                          _productNameController.text,
                          _productDescriptionController.text,
                          _productDetailsController.text,
                          _productPriceController.text,
                          _discountController.text,
                          product['product_id'].toString()
                        );
                        clearData();
                      }
                    },
                    child: Text('Update'))
              ],
            ),
          ),
        ));
  }

  void clearData() {
    _productNameController.clear();
    _productDescriptionController.clear();
    _productDetailsController.clear();
    _productPriceController.clear();
    _discountController.clear();
  }
}
