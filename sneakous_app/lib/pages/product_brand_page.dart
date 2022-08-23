import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:test_new_flutter/data/shoes.dart';
import 'package:test_new_flutter/pages/brand_page.dart';
import 'package:test_new_flutter/pages/product_page.dart';

class ProductBrandPage extends StatefulWidget{
  ProductBrandPage({super.key, required this.shoe, required this.findBrand});
  final shoe;
  final findBrand;
  @override
  State<ProductBrandPage> createState() => _ProductBrandPageState();
}

class _ProductBrandPageState extends State<ProductBrandPage> {
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;
  @override
  Widget build(BuildContext context) {
    Shoes findData = widget.shoe;
    Shoes shoeData = Shoes();
    shoeData.data = findData.data.where((element) => element["brand"]==widget.findBrand).toList();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(firstColor),
        actions: [
          IconButton(
            icon: Image.asset("assets/icons/bag_white.svg"),
            onPressed: (){},
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
        child: SingleChildScrollView(
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
                  // if(shoeData.data[index]["liked"]){
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
                  // }
                  // else{
                  //   return SizedBox.shrink();
                  // }
                } )
            ),
          ),
        ),
      ),
    );
  }
}