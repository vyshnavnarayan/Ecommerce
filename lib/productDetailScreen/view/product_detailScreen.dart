import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/myProducts/myProducts.dart';
import 'package:ecommerce1/myProducts/view/product_update.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.product}) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> product;
  @override
  Widget build(BuildContext context) {
  final images = product['product_images'] as List;

    
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(height: 200.0),
                  items: images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.network(image.toString()));
                      },
                    );
                  }).toList(),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProduct(product: product),));
                    }, icon: Icon(Icons.edit,),color: Colors.blueGrey,),
                  ],
                )
              ],
            ),
            // Center(
            //   child: SizedBox(
            //     height: 200,
            //     width: 200,
            //     child: Image.network(product['product_images'][0].toString())),
            // ),
            SizedBox(height: 5,),
            Text(product['product_name'].toString()),
            SizedBox(height: 5,),
            Text(product['description'].toString()),
            SizedBox(height: 5,),
            Row(
              children: [
                Icon(
                  Icons.currency_rupee,
                  size: 20,
                ),
                Text(
                  product['product_price'].toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
