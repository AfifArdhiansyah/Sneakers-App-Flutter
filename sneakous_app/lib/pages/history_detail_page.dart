import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetailPage extends StatefulWidget{
  HistoryDetailPage({super.key, required this.shoe, required this.index});
  final shoe;
  final index;
  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;

  @override
  Widget build(BuildContext context) {
    var orderList = widget.shoe.history[widget.index]["order"];
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(firstColor),
        title: Text("Detail Pesanan"),
        actions: [],
      ),
      body: ListView.separated(
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
                        child: Padding(padding: EdgeInsets.only(right: 5) ,child: Image.asset(orderList[index]["img_path"], width: screenWidth*0.32,))
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(orderList[index]["order"].toString() + "x " + orderList[index]["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, ),),
                          // Text(orderList[index]["order"].toString() + "item" , style: TextStyle( color: Colors.black)),
                          Text(CurrencyFormat.convertToIdr(orderList[index]["total"]).toString(), style: TextStyle( color: Colors.black))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: orderList.length
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                  Text(CurrencyFormat.convertToIdr(widget.shoe.history[widget.index]["total"]).toString(), style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            (widget.shoe.history[widget.index]["paid_status"])? FloatingActionButton.extended(
              backgroundColor: Color(thirdColor),
              onPressed: (){},
              label: const Text("sudah dibayar", style: TextStyle(color: Colors.black),)
            ) : FloatingActionButton.extended(
              backgroundColor: Color(secondColor),
              onPressed: (){
                setState(() {
                  widget.shoe.setPaidStatus(widget.index);
                });
              },
              label: const Text("bayar")),
          ],
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