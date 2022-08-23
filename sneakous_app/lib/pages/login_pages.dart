
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_new_flutter/pages/home_page.dart';

import '../data/shoes.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget{
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;

  final shoeData = Shoes();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/login_wp.png"),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login", style: TextStyle(color: Colors.white, fontSize: 30),),
                SizedBox(
                  width: 0.8*screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight*0.05,),
                      Text("username", style: TextStyle(color: Color(thirdColor), fontSize: 17)),
                      SizedBox(height: screenHeight*0.02,),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(thirdColor),
                          hintText: "masukkan username anda",
                          hintStyle: const TextStyle(
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                            borderSide: BorderSide(color: Colors.black)
                          )
                        ),
                      ),
                      SizedBox(height: screenHeight*0.03,),
                      Text("password", style: TextStyle(color: Color(thirdColor), fontSize: 17)),
                      SizedBox(height: screenHeight*0.02,),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(thirdColor),
                            hintText: "masukkan password anda",
                            hintStyle: const TextStyle(
                            ),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                      ),
                      SizedBox(height: screenHeight*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth*0.37,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUpPage())
                              );
                            },
                              style: ElevatedButton.styleFrom(
                                primary: Color(thirdColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                                child: const Text("Sign Up", style: TextStyle(color: Colors.black),)
                            ),
                          ),
                          SizedBox(
                            width: screenWidth*0.37,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage(shoe: shoeData,))
                              );
                            },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(secondColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)),
                                ),
                                child: Text("Log In", style: TextStyle(color: Color(thirdColor)),)
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenHeight*0.07,),
                Text("SneakOus", style: TextStyle(color: Color(thirdColor), fontSize: 30, fontWeight: FontWeight.bold),)
              ],
            ),
          )
        )
      ),
    );
  }
  
}
