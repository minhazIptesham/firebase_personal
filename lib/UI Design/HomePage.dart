import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Messege&Notify.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<String> _CarouselImage = [];
  var _dotPostition = 0;
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchCarourlImages() async {
    QuerySnapshot qn = await _firestoreInstance.collection("Slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _CarouselImage.add(
          qn.docs[i]["Image"],
        );
        // ignore: avoid_print
        print(qn.docs[i]["Image"]);
      }
    });

    return qn.docs;
  }

  fetchproducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add(
          {
            "Image": qn.docs[i]["Image"],
          });
        // ignore: avoid_print
        print(qn.docs[i]["Image"]);
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarourlImages();
    fetchproducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Text(
          "E-Commerce",
          style: TextStyle(
              color: Colors.deepOrange,
              fontSize: size.width * .07,
              fontWeight: FontWeight.bold),
        )),
      ),      //AppBar....
      body: SafeArea(
          child: Column(
            children: [
              //Search Box//
              Padding(

                padding: EdgeInsets.only(
                  left: size.width * .02,
                  right: size.width * .02,
                ),
                child: Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              fillColor: Colors.deepOrange,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(
                                  color: Colors.white12,
                                ),
                              ),
                            hintText: "Search product",
                            hintStyle: TextStyle(fontSize: size.width * .05),
                          ),
                        ),
                    ),
              ),       //Search Bar....
              SizedBox(
                height: size.height * .01,
              ),
              //Slider//
              AspectRatio(
                aspectRatio: 2.5,
                child: CarouselSlider(
                    items: _CarouselImage.map((item) => Padding(
                      padding:  EdgeInsets.only(left: 5,right: 5),
                      child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                    )).toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (val, carouselPageChangedReason) {
                          setState(() {
                            _dotPostition = val;
                          });
                        })),
              ),     //Slider....
              SizedBox(
                height: size.height * .01,
              ),
              DotsIndicator(
                dotsCount:
                    _CarouselImage.length == 0 ? 1 : _CarouselImage.length,
                position: _dotPostition.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Colors.deepOrange,
                  color: Colors.deepOrange.withOpacity(0.5),
                  spacing: EdgeInsets.all(2),
                  activeSize: Size(8, 8),
                  size: Size(6, 6),
                ),
              ),
              // SizedBox(
              //   height: size.height * .04,
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 220),
              //     child: Text("Categories..",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 18),),
              //   ),
              // ),
              //Category//
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //    GestureDetector(
              //      onTap: (){
              //        Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //      },
              //      child: Padding(
              //        padding:  EdgeInsets.only(right: 5,left: 5),
              //        child: Container(
              //          alignment: Alignment.center,
              //          decoration: BoxDecoration(
              //            color: Colors.grey[300],
              //            borderRadius: BorderRadius.circular(15),
              //            boxShadow:
              //            [
              //              BoxShadow(color: Colors.grey[500]!,
              //                offset: const Offset(8, 8),
              //                blurRadius: 15,
              //                spreadRadius: 1,
              //              ),
              //              BoxShadow(
              //                color: Colors.white,
              //                offset: Offset(-8, -8),
              //                blurRadius: 15,
              //                spreadRadius: 1,
              //              ),
              //            ],
              //          ),
              //          child: Column(
              //            children: [
              //              Container(
              //                height: size.height*.09,
              //                width: size.width*.20,
              //                decoration: BoxDecoration(
              //                  image: DecorationImage(
              //                      image: AssetImage("asset/image/cosmetics.png"), fit: BoxFit.fill
              //                  ),
              //                ),
              //              ),
              //              Container(
              //                  child: Padding(
              //                    padding: const EdgeInsets.only(bottom: 5),
              //                  ))
              //            ],
              //          ),
              //        ),
              //    ),
              //    ),
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //       },
              //       child: Padding(
              //         padding:  EdgeInsets.only(right: 5,left: 5),
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.grey[300],
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow:
              //             [
              //               BoxShadow(color: Colors.grey[500]!,
              //                 offset: const Offset(8, 8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //               BoxShadow(
              //                 color: Colors.white,
              //                 offset: Offset(-8, -8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: size.height*.09,
              //                 width: size.width*.20,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/image/Skin care.png"), fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(bottom: 5),
              //                   ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //       },
              //       child: Padding(
              //         padding:  EdgeInsets.only(left: 5,right: 5),
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.grey[300],
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow:
              //             [
              //               BoxShadow(color: Colors.grey[500]!,
              //                 offset: const Offset(8, 8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //               BoxShadow(
              //                 color: Colors.white,
              //                 offset: Offset(-8, -8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: size.height*.09,
              //                 width: size.width*.20,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/image/Personal care.png"), fit: BoxFit.fill
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(bottom: 5),
              //                   ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //       },
              //       child: Padding(
              //         padding:  EdgeInsets.only(left: 5,right: 5),
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.grey[300],
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow:
              //             [
              //               BoxShadow(color: Colors.grey[500]!,
              //                 offset: const Offset(8, 8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //               BoxShadow(
              //                 color: Colors.white,
              //                 offset: Offset(-8, -8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: size.height*.09,
              //                 width: size.width*.20,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/image/Food Supplements.png"), fit: BoxFit.fill
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(bottom: 5),
              //                   ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: size.height * .01,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //       },
              //       child: Padding(
              //         padding:  EdgeInsets.only(right: 5,left: 5),
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.grey[300],
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow:
              //             [
              //               BoxShadow(color: Colors.grey[500]!,
              //                 offset: const Offset(8, 8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //               BoxShadow(
              //                 color: Colors.white,
              //                 offset: Offset(-8, -8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: size.height*.09,
              //                 width: size.width*.20,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/image/Beauty Tools.png"), fit: BoxFit.fill
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(bottom: 5),
              //                   ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //       },
              //       child: Padding(
              //         padding:  EdgeInsets.only(right: 5,left: 5),
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.grey[300],
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow:
              //             [
              //               BoxShadow(color: Colors.grey[500]!,
              //                 offset: const Offset(8, 8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //               BoxShadow(
              //                 color: Colors.white,
              //                 offset: Offset(-8, -8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: size.height*.09,
              //                 width: size.width*.20,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/image/Medical Supplies.png"), fit: BoxFit.fill
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(bottom: 5),
              //                   ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //       },
              //       child: Padding(
              //         padding:  EdgeInsets.only(left: 5,right: 5),
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.grey[300],
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow:
              //             [
              //               BoxShadow(color: Colors.grey[500]!,
              //                 offset: const Offset(8, 8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //               BoxShadow(
              //                 color: Colors.white,
              //                 offset: Offset(-8, -8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: size.height*.09,
              //                 width: size.width*.20,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/image/hair-cream.png"), fit: BoxFit.fill
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(bottom: 5),
              //                   ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
              //       },
              //       child: Padding(
              //         padding:  EdgeInsets.only(left: 5,right: 5),
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.grey[300],
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow:
              //             [
              //               BoxShadow(color: Colors.grey[500]!,
              //                 offset: const Offset(8, 8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //               BoxShadow(
              //                 color: Colors.white,
              //                 offset: Offset(-8, -8),
              //                 blurRadius: 15,
              //                 spreadRadius: 1,
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: size.height*.09,
              //                 width: size.width*.20,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/image/Sexul Health.png"), fit: BoxFit.fill
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(bottom: 5),
              //                   ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //
              //   ],
              // ),
              SizedBox(
                height: size.height * .01,
              ),
              //Product List//
              Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 180,
                ),
                    itemCount: _products.length,
                    itemBuilder: (_,index){
                  return GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height*.12,
                            width: size.width*.50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(_products[index]["Image"]),fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Container(
                              child: Padding(
                                padding:  EdgeInsets.only(bottom: 3),
                                // child: Column(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.all(3.0),
                                //       child: Text("Minhaz", style: TextStyle( fontSize: 10,fontWeight: FontWeight.bold),maxLines: 2,),
                                //     ),
                                //     Container(decoration:BoxDecoration(
                                //         color: Colors.orange,
                                //         borderRadius: BorderRadius.circular(30)),child: Padding(
                                //       padding: const EdgeInsets.all(5.0),
                                //       child: Text("Hotest", style: TextStyle( fontSize: 10),),
                                //     )),
                                //     Padding(
                                //       padding:  EdgeInsets.all(2.0),
                                //       child: Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         children: [
                                //           Text("50", style: TextStyle( fontSize: 10),),
                                //           SizedBox(width: 5,),
                                //           Text("20", style: TextStyle( fontSize: 10,decoration: TextDecoration.lineThrough,color: Colors.black38),),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,color: Colors.deepOrange,size: 16,),
                                  Icon(Icons.star,color: Colors.deepOrange,size: 16,),
                                  Icon(Icons.star,color: Colors.deepOrange,size: 16,),
                                  Icon(Icons.star,color: Colors.deepOrange,size: 16,),
                                  Icon(Icons.star,size: 16,),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                    }),
              ),
                      ],
                    ),
          ),
        );
  }
}
