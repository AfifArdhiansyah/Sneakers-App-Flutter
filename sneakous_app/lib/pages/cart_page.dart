import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_new_flutter/pages/history_page.dart';

import '../data/shoes.dart';

class CartPage extends StatefulWidget{
  CartPage({super.key, required this.shoe});
  final shoe;
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cartList = widget.shoe.getOrderList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(firstColor),
        title: Text("Keranjang"),
        actions: [],
      ),
      body: (cartList.length>0)? ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return Card(
              color: Color(thirdColor),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                        child: Padding(padding: EdgeInsets.only(right: 5) ,child: Image.asset(cartList[index]["img_path"], width: screenWidth*0.32,))
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartList[index]["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, ),),
                          Text(CurrencyFormat.convertToIdr(cartList[index]["price"]).toString(), style: TextStyle( color: Colors.black))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  widget.shoe.addItemOrder(cartList[index]["id"]);
                                });
                              },
                              icon: Icon(Icons.add)
                          ),
                          Text(cartList[index]["order"].toString()),
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  widget.shoe.removeItemOrder(cartList[index]["id"]);
                                });
                              },
                              icon: Icon(Icons.remove)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: cartList.length)
      : Center(child: Text("Tidak ada produk", style: TextStyle(color: Colors.white, fontSize: 17),),),
      bottomNavigationBar: BottomAppBar(
        color: Color(firstColor),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text(CurrencyFormat.convertToIdr(widget.shoe.getOrderAmout()).toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(secondColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: (){
                    setState(() {
                      widget.shoe.addHistory();
                      widget.shoe.resetCartList();
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>HistoryPage(shoe: widget.shoe))
                    );
                  },
                  child: SizedBox(
                      width:screenWidth ,
                      child: const Align(
                        alignment: Alignment.center,
                          child: const Text("pesan")
                      )
                  )
              )
            ],
          ),
        ),
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