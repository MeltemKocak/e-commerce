// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application/components/header.dart';
import 'package:flutter_application/components/label.dart';

//import 'header.dart';

class ProductDetailPage extends StatefulWidget {

String productTitle;
ProductDetailPage(this.productTitle);

    @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //header
            header(widget.productTitle, context),
            SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
              //new etiketi
                label("New"),

                SizedBox(height: 25),
                //ürün fotografı
                Image.asset("assets(images/sam1.png"),

                SizedBox(height: 30),

                //renk seçenekleri
                Text(
                  "Color",
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0A1034),
                ),)

                //kapasite


                //sepete ekle butonu
              ],),
            )
            
            ]))
    ])));
  }
}