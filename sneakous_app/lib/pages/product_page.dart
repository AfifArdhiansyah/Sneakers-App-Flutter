import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_new_flutter/pages/cart_page.dart';
import '../data/shoes.dart';

class ProductPage extends StatefulWidget{
  const ProductPage({super.key, required this.data, required this.productData, required this.dataIndex});
  final Shoes data;
  final Map productData;
  final int dataIndex;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;

  @override
  Widget build(BuildContext context) {
    final Map data = widget.productData;
    final shoeData = widget.data;
    final dataIndex = widget.dataIndex;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon( Icons.arrow_back),
          onPressed: () { Navigator.pop(context); },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(thirdColor),
        actions: [
          IconButton(
            icon: data["liked"]? SvgPicture.asset("assets/icons/like_red_small.svg", width: 35,) : SvgPicture.asset("assets/icons/like.svg"),
            onPressed: (){
              setState(() {
                if(data["liked"]){
                  shoeData.setLiked(dataIndex, false);
                }
                else{
                  shoeData.setLiked(dataIndex, true);
                }
              });
            },
          )
        ],
        elevation: 0,
      ),
      body: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(thirdColor)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight*0.35,
              child: Image.asset(
                data["img_path"],
                width: screenWidth*0.8,
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(firstColor)),
                  child: ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: Color(thirdColor),
                      height: screenHeight*0.1,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: screenHeight*0.4,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Color(firstColor),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data["brand"][0].toUpperCase() + data["brand"].substring(1).toLowerCase() + " " + data["name"], style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
                      const Text("ini adalah sepatu Nike Air Jordan bahannya bagus banget kalian harus cobain sepatu ini. Sepatu ini keren banget lah pokoknya", style: TextStyle(color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(CurrencyFormat.convertToIdr(data["price"]).toString(), style: TextStyle(fontSize: 25, color: Colors.white),),
                          ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  widget.data.addItemOrder(dataIndex);
                                });
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(shoe: widget.data)));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(thirdColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              child: const Text("Add to Cart", style: TextStyle(color: Colors.black),)
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width/2, 0, size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
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