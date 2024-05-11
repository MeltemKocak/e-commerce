// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application/components/bottomNavigation.dart';
import 'package:flutter_application/components/header.dart';

import 'components/category.dart';

class CategoriesPage extends StatelessWidget{  //StatelessWidget in içindeki tüm değişkenler final dır


List<String> categories = [
  "All",
  "Computers",
  "Accessories",
  "Smartphones",
  "Smart Objects",
  "Speakers"
   "All",
  "Computers",
  "Accessories",
  "Smartphones",
  "Smart Objects",
  "Speakers"
];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  header("Categories", context),
                  SizedBox(height: 16),
          //kategoriler
                  Expanded(
                    child: ListView(
                      children: categories
                      .map((String title) => buildCategory(title, context))
                      .toList()),
                  ),

                  
        ])),
        //bottom navigation
        bottomNavigationBar("search"),
    ])));
  }
}

Widget buildCategory(String title, context){
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) { //material tarzı yani android tarzı geçiş için
       return CategoryPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 4, offset: Offset(0,4)),
      ],),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0A1034),
        ),
                      ),
                      ),
  );
}