
import 'package:intl/intl.dart';

String pathToImg = "assets/img/";
String pathToLogo = "assets/icons/";

class Shoes{

  Shoes();

  List<Map<String, dynamic>> data = [
    {
      "id" : 0,
      "brand" : "nike",
      "name" : "Air Force 1 Luxe",
      "img_path" : pathToImg + "nike/air_force_1_luxe.png",
      "liked" : false,
      "price" : 1979000,
      "logo" : pathToLogo + "nike.svg",
      "order" : 0,
    },
    {
      "id" : 1,
      "brand" : "nike",
      "name" : "Air Jordan 1 Mid",
      "img_path" : pathToImg + "nike/air_jordan_1_mid.png",
      "liked" : false,
      "price" : 1799000,
      "logo" : pathToLogo + "nike.svg",
      "order" : 0,
    },
    {
      "id" : 2,
      "brand" : "nike",
      "name" : "Air Jordan 3 Retro",
      "img_path" : pathToImg + "nike/air_jordan_3_retro.png",
      "liked" : false,
      "price" : 3199000,
      "logo" : pathToLogo + "nike.svg",
      "order" : 0,
    },
    {
      "id" : 3,
      "brand" : "nike",
      "name" : "Zion 2 PF",
      "img_path" : pathToImg + "nike/zion_2_pf.png",
      "liked" : false,
      "price" : 2059000,
      "logo" : pathToLogo + "nike.svg",
      "order" : 0,
    },
    {
      "id" : 4,
      "brand" : "adidas",
      "name" : "Forum Low Hebru Brantley",
      "img_path" : pathToImg + "adidas/forum_low_hebru_brantley.png",
      "liked" : false,
      "price" : 2000000,
      "logo" : pathToLogo + "adidas.svg",
      "order" : 0,
    },
    {
      "id" : 5,
      "brand" : "adidas",
      "name" : "Solarglide 4st",
      "img_path" : pathToImg + "adidas/solarglide_4st.png",
      "liked" : false,
      "price" : 3000000,
      "logo" : pathToLogo + "adidas.svg",
      "order" : 0,
    },
    {
      "id" : 6,
      "brand" : "adidas",
      "name" : "Ultra 4D",
      "img_path" : pathToImg + "adidas/ultra_4d.png",
      "liked" : false,
      "price" : 4000000,
      "logo" : pathToLogo + "adidas.svg",
      "order" : 0,
    },
    {
      "id" : 7,
      "brand" : "adidas",
      "name" : "Ultraboost 22x Marimekko",
      "img_path" : pathToImg + "adidas/ultraboost_22x_marimekko.png",
      "liked" : false,
      "price" : 3500000,
      "logo" : pathToLogo + "adidas.svg",
      "order" : 0,
    },
    {
      "id" : 8,
      "brand" : "puma",
      "name" : "H.S.T 20 Kit",
      "img_path" : pathToImg + "puma/hst_20_kit.png",
      "liked" : false,
      "price" : 999000,
      "logo" : pathToLogo + "puma.svg",
      "order" : 0,
    },
    {
      "id" : 9,
      "brand" : "puma",
      "name" : "Smash V2 Leather Boy's",
      "img_path" : pathToImg + "puma/smash_v2_leather_boys.png",
      "liked" : false,
      "price" : 559000,
      "logo" : pathToLogo + "puma.svg",
      "order" : 0,
    },
    {
      "id" : 10,
      "brand" : "reebok",
      "name" : "Club C",
      "img_path" : pathToImg + "reebok/club_c.png",
      "liked" : false,
      "price" : 1449000,
      "logo" : pathToLogo + "reebok.svg",
      "order" : 0,
    },
    {
      "id" : 11,
      "brand" : "reebok",
      "name" : "Club C 85",
      "img_path" : pathToImg + "reebok/club_c_85.png",
      "liked" : false,
      "price" : 999000,
      "logo" : pathToLogo + "reebok.svg",
      "order" : 0,
    },
    {
      "id" : 12,
      "brand" : "reebok",
      "name" : "Royal Techque T",
      "img_path" : pathToImg + "reebok/royal_techque_t.png",
      "liked" : false,
      "price" : 669000,
      "logo" : pathToLogo + "reebok.svg",
      "order" : 0,
    },
  ];

  setLiked(int index, bool val){
    data[index]["liked"] = val;
  }

  List <Map<String, dynamic>> order = [

  ];

  getOrderList(){
    return data.where((element) => element["order"] > 0).toList();
  }

  addItemOrder(int index){
    data[index]["order"]++;
  }

  getOrderAmout(){
    int? amount = 0;
    data.forEach((element) {
      amount = (amount! + element["price"]*element["order"]) as int?;
    });
    return amount;
  }

  removeItemOrder(int index){
    if(data[index]["order"]>0) data[index]["order"]--;
  }

  removeOrder(int index){
    order.removeAt(index);
  }

  List <Map<String, dynamic>> history = [

  ];

  setPaidStatus(int index){
    history[index]["paid_status"] = true;
  }

  getAllOrderItem(){
    List<Map<String, dynamic>> itemOrder = [];
    data.forEach((element) {
      if(element["order"]>0){
        itemOrder.add({
          "name" : element["name"],
          "img_path" : element["img_path"],
          "order" : element["order"],
          "total" : element["order"]*element["price"]
        });
      }
    });
    return itemOrder;
  }

  resetCartList(){
    data.forEach((element) {
      element["order"] = 0;
    });
  }

  addHistory() {
    if (getOrderAmout() > 0) {
      history.add({
        "time": DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()),
        "total": getOrderAmout(),
        "paid_status": false,
        "order": getAllOrderItem()
      });
    }
  }
}