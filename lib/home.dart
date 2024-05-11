import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/categories.dart';
import 'package:flutter_application/components/bottomNavigation.dart';
import 'package:flutter_application/components/label.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
        double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


//**********  BASLIK
                  buildBaslik(),  

//**********  BANNER
                  buildBanner(),

//**********  BUTONLAR
                  Padding(
                    padding: EdgeInsets.only(top: 48), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //İLK ELEMAN
                        buildNavigation(text: "Categories", icon: Icons.menu, widget: CategoriesPage(), context: context),
                        buildNavigation(text: "Favorites", icon: Icons.star_border),
                        buildNavigation(text: "Gifts", icon: Icons.card_giftcard),
                        buildNavigation(text: "Best Selling", icon: Icons.people),
                      ],
                    ),
                  ),
        
                  SizedBox(height: 40),
//**********  SALES TITLE
                  Text(
                    "Sales", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 24, 
                      color: Color(0XFF0A1034)),
                  ),
                  SizedBox(height: 16),

//**********  SALES ITEMS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItems(
                        text: "Smartphones", 
                        photoUrl: "assets/images/smartphone.png", 
                        discount: "-50%", 
                        screenWidth: screenWidth,
                      ),

                        buildSalesItems(
                        text: "Monitors", 
                        photoUrl: "assets/images/monitor.png", 
                        discount: "-50%", 
                        screenWidth: screenWidth),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItems(
                        text: "Smartphones", 
                        photoUrl: "assets/images/speaker.png", 
                        discount: "-50%", 
                        screenWidth: screenWidth,
                      ),

                        buildSalesItems(
                        text: "Laptop", 
                        photoUrl: "assets/images/iphone11pro.png", 
                        discount: "-50%", 
                        screenWidth: screenWidth),
                    ],
                  ),
                ],
              ),
            ),

            //BOTTOM NAVIGATION BAR
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}



Widget buildBaslik(){
  return  Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Home" , 
      style:  TextStyle(
        fontSize: 32,
        color: Color(0xFF0A1034),
       fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner(){
  return Padding(
    padding: EdgeInsets.only(top: 24),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24,right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(color: Color(0xFF0001FC),
      borderRadius: BorderRadius.circular(6)),
                
                
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          "Bose Home Speaker" , 
          style: TextStyle(
            color:  Colors.white, 
            fontSize: 18, 
            fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4,),
        Text(
          "USD 279" , 
          style: TextStyle(
          color:  Colors.white, 
          fontSize: 12, 
          fontWeight: FontWeight.w500),
        ),
        ],
      ),
      //Expanded(child: Image.asset("assets/images/bosespeaker.png" , width: 100, height: 100,)),   //**** */
      
    ],
  )));      
                
}

Widget buildNavigation({
  required String text, 
  required IconData icon, 
  Widget? widget,
  BuildContext? context,
  
}) {
  return GestureDetector(  //kategori butonlarına dokunabilmek için
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) { //material tarzı yani android tarzı geçiş için
       return widget!;
      }));
    },
  child: Column(
    children: [
      Container(
        
        padding: EdgeInsets.symmetric(
          horizontal: 19, vertical: 22),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE0ECF8)),
        child: Icon(
          icon, 
          color: Color(0xFF0001FC), 
          size: 18,
        ),
      ),
      SizedBox(height: 8,),
      Text(
        text, 
        style: TextStyle(
          color: Color(0xFF1F53E4), 
          fontSize: 14, 
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  ),  
  );
}

Widget buildSalesItems({required String text, required String photoUrl, required String discount, required double screenWidth,}){
  return    Container(
    //color: Colors.red,
    width: (screenWidth - 60)*0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21,right: 12),
  
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      label(discount),
      SizedBox(height: 22),       
      //telefon resmi
      Image.asset(photoUrl),   //*** */
      SizedBox(height: 22),
      //ismi
      Center(
        child: Text(text, 
          style: TextStyle(fontSize: 18, color: Color(0xFF0A1034))),
      ), 
    ],),
  );
}