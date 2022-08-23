import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:test_new_flutter/data/shoes.dart';
import 'package:test_new_flutter/pages/brand_page.dart';
import 'package:test_new_flutter/pages/product_page.dart';

import 'cart_page.dart';
import 'history_page.dart';
import 'home_page.dart';

class LikedPage extends StatefulWidget{
  LikedPage({super.key, required this.shoe});
  final shoe;
  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;

  @override
  Widget build(BuildContext context) {
    Shoes likedData = widget.shoe;
    Shoes shoeData = Shoes();
    shoeData.data = likedData.data.where((element) => element["liked"]==true).toList();
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(shoe: widget.shoe)));
            },
          )
        ],
      ),
      body: Container(
        width: screenWidth,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(firstColor) ,
          // color: Colors.white
        ),
        child: (shoeData.data.length>0)? SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(firstColor)
            ),
            child: GridView.count(
              shrinkWrap: true,
              childAspectRatio: 3/4,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(shoeData.data.length, growable: true, (index){
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(thirdColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=> ProductPage(data: widget.shoe, productData: shoeData.data[index], dataIndex: shoeData.data[index]["id"],)
                          )
                      ).then((value){
                        setState(() {
                          shoeData.data = widget.shoe.data;
                        });
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(shoeData.data[index]["logo"],
                                width: screenWidth*0.1,
                              ),
                              IconButton(
                                icon: shoeData.data[index]["liked"] ? SvgPicture.asset("assets/icons/like_red_small.svg",
                                  width: screenWidth*0.07,
                                )
                                    :
                                SvgPicture.asset("assets/icons/like.svg",
                                  width: screenWidth*0.07,
                                ) ,
                                onPressed: (){
                                  setState(() {
                                    if(shoeData.data[index]["liked"]){
                                      shoeData.setLiked(index, false);
                                    }
                                    else{
                                      shoeData.setLiked(index, true);
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                          Image.asset(shoeData.data[index]["img_path"], width: screenWidth*0.4,),
                          Text(shoeData.data[index]["name"], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.center,),
                          Text(CurrencyFormat.convertToIdr(shoeData.data[index]["price"]).toString(), style: TextStyle( color: Colors.black))
                        ],
                      ),
                    ),
                  );
              } )
            )
          ),
        ) : Center(child: Text("Tidak ada produk yang di-like", style: TextStyle(color: Colors.white, fontSize: 17),),),
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
                      MaterialPageRoute(builder: (context) => HomePage(shoe: widget.shoe,))
                  );
                },
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/box.svg", color: Color(fifthColor),) ,
                color: Color(fourthColor),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BrandPage(shoeData: widget.shoe))
                  );
                },
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/like.svg", color: Colors.black) ,
                onPressed: (){},
                color: Color(fourthColor),
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/account.svg", color: Color(fifthColor),) ,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>HistoryPage(shoe: widget.shoe)
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

class CurrencyFormat {
  static String convertToIdr(dynamic number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp ',
        decimalDigits: 0
    );
    return currencyFormatter.format(number);
  }
}