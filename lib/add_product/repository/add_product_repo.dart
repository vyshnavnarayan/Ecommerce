import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class addProductRepo {
  final _auth = FirebaseAuth.instance;
  final CollectionReference productRef =
      FirebaseFirestore.instance.collection('productcollection');
  Future<void> createProduct(String product, String description, String details,
      String price, String discount, List<XFile> images) async {
    final uuid = Uuid();
    final ecomId = uuid.v4();
    final date = DateTime.now();
    final currentDate = '${date.day}-${date.month}-${date.year}';
    List<String>? productImages = [];

    try {
      for (final element in images) {
        final referance = FirebaseStorage.instance
            .ref()
            .child('product_images')
            .child(element.name);
        final file = File(element.path);
        await referance.putFile(file);
        final productimage = await referance.getDownloadURL();
        productImages.add(productimage);

        print(productimage);
      }

      await productRef.doc(ecomId).set({
        'product_name': product,
        'description': description,
        'product_details': details,
        'product_price': price,
        'discount': discount,
        'user_id': _auth.currentUser!.uid,
        'date': currentDate,
        'product_id': ecomId,
        'product_images': productImages
      });
    } catch (e) {}
  }

  void deleteProduct(String product_id) {
    productRef.doc(product_id).delete();
  }

  void updateProduct(String product, String description, String details,
      String price, String discount, String product_id) {
    productRef.doc(product_id).update({
      'product_name': product,
      'description': description,
      'product_details': details,
      'product_price': price,
      'discount': discount,
    });
  }
}
