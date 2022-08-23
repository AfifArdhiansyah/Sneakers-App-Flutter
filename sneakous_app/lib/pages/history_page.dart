import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:test_new_flutter/pages/history_detail_page.dart';
import 'brand_page.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'liked_page.dart';

class HistoryPage extends StatefulWidget{
  HistoryPage({super.key, required this.shoe});
  final shoe;
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var historyList = widget.shoe.history;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:(historyList.length>0)? ListView.separated(
          // shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(thirdColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: (){
                        Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context)=>HistoryDetailPage(shoe: widget.shoe, index: index,))
                        ).then((value){
                          setState(() {
                            historyList = widget.shoe.history;
                          });
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total : " + CurrencyFormat.convertToIdr(historyList[index]["total"]).toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                                SizedBox(height: 10),
                                Text(historyList[index]["time"], style: TextStyle(color: Colors.black),),
                              ],
                            ),
                            Text((historyList[index]["paid_status"])? "Sudah Bayar" : "Belum Dibayar", style: TextStyle(color: Colors.black),)
                          ],
                        ),
                      )
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: historyList.length
        ) : Center(child: Text("Tidak ada History", style: TextStyle(color: Colors.white, fontSize: 17),),),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        elevation: 20,
        backgroundColor: Color(thirdColor),
        currentIndex: 0,
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
                    MaterialPageRoute(builder: (context)=>BrandPage(shoeData: widget.shoe)
                    ),
                  );
                },
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/like.svg", color: Color(fifthColor),) ,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>LikedPage(shoe: widget.shoe,)
                    ),
                  );
                },
                color: Color(fourthColor),
              )
          ),
          FloatingNavbarItem(
              customWidget: IconButton(
                icon: SvgPicture.asset("assets/icons/account.svg", color: Colors.black,) ,
                onPressed: (){},
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