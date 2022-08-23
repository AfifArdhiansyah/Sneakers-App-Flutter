
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_new_flutter/pages/home_page.dart';

import '../data/shoes.dart';
import 'login_pages.dart';

class SignUpPage extends StatelessWidget{
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
        decoration: BoxDecoration(
          color: Color(firstColor)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 30),),
              SizedBox(
                width: 0.8*screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight*0.05,),
                    Text("email", style: TextStyle(color: Color(thirdColor), fontSize: 17)),
                    SizedBox(height: screenHeight*0.02,),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(thirdColor),
                          hintText: "masukkan email anda",
                          hintStyle: const TextStyle(
                          ),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                              borderSide: BorderSide(color: Colors.black)
                          )
                      ),
                    ),
                    SizedBox(height: screenHeight*0.03,),
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
                          hintText: "buat password",
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
                              MaterialPageRoute(builder: (context)=> LoginPage())
                            );
                          },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(thirdColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              child: const Text("Cancel", style: TextStyle(color: Colors.black),)
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
                              child: Text("Submit", style: TextStyle(color: Color(thirdColor)),)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

}