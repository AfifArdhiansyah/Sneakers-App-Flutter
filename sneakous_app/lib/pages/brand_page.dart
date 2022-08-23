import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:test_new_flutter/data/brands.dart';
import 'package:test_new_flutter/pages/liked_page.dart';
import 'package:test_new_flutter/pages/product_brand_page.dart';
import 'cart_page.dart';
import 'history_page.dart';
import 'home_page.dart';

class BrandPage extends StatelessWidget{
  BrandPage({super.key, required this.shoeData});
  final shoeData;

  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;

  final brands = Brands();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("SneakOus", style: TextStyle(color: Color(thirdColor), fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: Color(firstColor),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Image.asset("assets/icons/bag_white.svg"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(shoe: shoeData)));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight*0.1, horizontal: screenWidth*0.05),
        decoration: BoxDecoration(
          color: Color(firstColor)
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index){
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(thirdColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                  onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductBrandPage(shoe: shoeData, findBrand: brands.data[index]["name"])
                      )
                  );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(brands.data[index]["icon_path"], width: screenWidth*0.15,),
                        Text(brands.data[index]["name"][0].toUpperCase() + brands.data[index]["name"].substring(1).toLowerCase(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                        Image.asset(brands.data[index]["img_path"], width: screenWidth*0.37,)
                      ],
                    ),
                  )
              );
            },
            separatorBuilder: (BuildContext context, int index){
              return SizedBox(height: screenHeight*0.02,);
            },
            itemCount: brands.data.length
        ),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        elevation: 20,
        backgroundColor: Color(thirdColor),
        currentIndex: 1,
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        borderRadius: 50,
        selectedBackgroundColor: Colors.transparent,
        items: [
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/home.svg", color: Color(fifthColor),) ,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(shoe: shoeData,))
                  );
                },
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/box.svg", color: Colors.black,) ,
                color: Color(fourthColor),
                onPressed: (){},
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/like.svg", color: Color(fifthColor),) ,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>LikedPage(shoe: shoeData,)
                    ),
                  );
                },
                color: Color(fourthColor),
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/account.svg", color: Color(fifthColor),) ,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>HistoryPage(shoe: shoeData)
                    ),
                  );
                },
                color: Color(fourthColor),
              )
          ),
        ],
        onTap: (int val) {  },
      ),
    );
  }

}