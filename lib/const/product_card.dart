import 'package:firebase_pinput1/home_page/cart_page.dart';
import 'package:firebase_pinput1/home_page/like_page.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:readmore/readmore.dart';

class ProductCardTile extends StatefulWidget {
  final dynamic data;

  ProductCardTile({Key? key, this.data}) : super(key: key);

  @override
  State<ProductCardTile> createState() => _ProductCardTileState();
}

class _ProductCardTileState extends State<ProductCardTile> {
  bool likedata = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          useSafeArea: true,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              actionsPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(8),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Details'),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              content: InteractiveViewer(
                minScale: 0.1,
                maxScale: 1.9,
                child: Column(
                  children: [
                    Image.network(
                      widget.data['image'],
                      height: size.height * 0.5,
                      width: size.width,
                    ),
                    Text(
                      widget.data['title'],
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '₹',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          widget.data!['price'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: IconButton(
                            splashColor: Colors.blue,
                            tooltip: 'Add to cart',
                            onPressed: () {
                              cartimage.add(widget.data['image']!);
                              cartname.add(widget.data['title']);
                              cartprice.add(widget.data!['price']);
                            },
                            icon: Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 30,
                            ),
                            color: Colors.blue,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              likeimage.add(widget.data['image']!);
                              likename.add(widget.data['title']);
                              likeprice.add(widget.data!['price']);
                              setState(() {
                                likedata = true;
                              });
                            },
                            child: likedata
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  )
                                : Icon(Icons.favorite, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Center(
                            child: Text('Oder Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  widget.data['image']!,
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 2.0),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(right: 5, left: 5, bottom: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReadMoreText(
                      widget.data['title'],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      trimLines: 3,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '₹',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              widget.data!['price'].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: IconButton(
                            splashColor: Colors.blue,
                            tooltip: 'Add to cart',
                            onPressed: () {
                              cartimage.add(widget.data['image']!);
                              cartname.add(widget.data['title']);
                              cartprice.add(widget.data!['price']);
                            },
                            icon: Icon(Icons.add_shopping_cart_rounded),
                            color: Colors.blue,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              likeimage.add(widget.data['image']!);
                              likename.add(widget.data['title']);
                              likeprice.add(widget.data!['price']);
                              setState(() {
                                likedata = true;
                              });
                            },
                            child: likedata
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  )
                                : Icon(Icons.favorite, color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
