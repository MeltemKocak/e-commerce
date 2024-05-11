// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/header.dart';
import 'package:flutter_application/components/productDetail.dart';

import 'bottomNavigation.dart';

class CategoryPage extends StatelessWidget {

String categoryTitle;
CategoryPage(this.categoryTitle);


  List<Map> products = [
    {"isim": "SAMSUNG Laptop 1", "fotograf" : "assets/images/sam1.png", "fiyat": "999"},
    {"isim": "ACER Laptop 2",    "fotograf" : "assets/images/acer2.jpg", "fiyat": "1250"},
    {"isim": "LENOVO Laptop 3",  "fotograf" : "assets/images/laptop1.png", "fiyat": "856"},
    {"isim": "ASUS Laptop 4",    "fotograf" : "assets/images/laptop.png", "fiyat": "1240"},
    {"isim": "MACBOOK ",         "fotograf" : "assets/images/laptop.png", "fiyat": "1100"},
    {"isim": "DELL Laptop 6",    "fotograf" : "assets/images/dell.png", "fiyat": "1310"},
    {"isim": "HP Laptop 7",     "fotograf" : "assets/images/hp3.png", "fiyat": "965"},
    {"isim": "ASD Laptop 8",    "fotograf" : "assets/images/laptop.png", "fiyat": "979"},
    {"isim": "JKL Laptop 9",    "fotograf" : "assets/images/laptop.png", "fiyat": "959"},
  ];
  
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
            header(categoryTitle, context),
            SizedBox(height: 32),
           
           
            //içerikler
            //buildContent("Surface Laptop 3", "assets/images/smartphone.png", "999"),

            Expanded(
              child: GridView.count(crossAxisCount: 2,mainAxisSpacing: 10, crossAxisSpacing:10, children: products.map((Map product){
                return buildContent(product["isim"], product["fotograf"], product["fiyat"], context);
              }).toList(),
              ),
            )
          ]),
          ),
          //bottom navigation
          bottomNavigationBar("search"),
          ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context){
  return  GestureDetector(
    onTap: (){
      Navigator.push(context!, MaterialPageRoute(builder: (context) { //material tarzı yani android tarzı geçiş için
       return ProductDetailPage(title);
      }));
    },
    child: Container(
     padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6), 
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08), 
          blurRadius: 24, 
          offset: Offset(0, 16)),
      ],
   ),
  
    child: Column(
      children: [
        SizedBox(height: 16),
        Image.asset(photoUrl),               
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, 
              style: TextStyle(
                color: Color(0xFF0A1034),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "USD $price", 
              style: TextStyle(
              color: Color(0xFF0001FC),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              ),
            ),
            //SizedBox(height: 18),
          ],           
        )
      ],
    )
    ),
  );
}