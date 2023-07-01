import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

List cartimage = [];
List cartname = [];
List cartprice = [];

class Cart_Page extends StatefulWidget {
  const Cart_Page({Key? key}) : super(key: key);

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "CART",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartimage.length,
                  itemBuilder: (context, index) => Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 2)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(cartimage[index]),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: 150,
                                child: Container(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartname[index],
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "\$${cartprice[index]}",
                                        style: GoogleFonts.nunito(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15, left: 15),
                              child: InkWell(
                                child: Icon(Icons.delete),
                                onTap: () {
                                  cartimage.remove(cartimage[index]);
                                  cartname.remove(cartname[index]);
                                  cartprice.remove(cartprice[index]);
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
