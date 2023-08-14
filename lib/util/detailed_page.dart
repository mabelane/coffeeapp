import 'dart:ui';

import 'package:coffeeapp/view/blur_effect.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../model/Coffee.dart';
import 'constants/colors_dark.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({
    super.key,
    required this.coffee,
  });
  final Coffee coffee;
  final int cupIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.6,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35)),
                    child: Image.network(
                      coffee.image,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SafeArea(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Card(
                                  color: bgBlack,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 16,
                                        color: bgTxtGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Card(
                                  color: bgBlack,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const InkWell(
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite_rounded,
                                        size: 16,
                                        color: bgTxtGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        BlurEffect(
                          height: size.height * 0.165,
                          borderRadius: BorderRadius.circular(35),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coffee.title,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coffee.extras,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 188, 188, 188),
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.025,
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: btBrown,
                                            size: 23,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            coffee.rating.toStringAsFixed(1),
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: bgTxtWhite),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.16,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            height: size.height * 0.075,
                                            width: size.width * 0.16,
                                            child: const Card(
                                              color: bgBlack,
                                              shape: RoundedRectangleBorder(
                                                side:
                                                    BorderSide(color: btBrown),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.coffee_rounded,
                                                    color: btBrown,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    "Coffee",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: bgTxtWhite),
                                                  )
                                                ],
                                              ),
                                            )),
                                        SizedBox(
                                          width: size.width * 0.045,
                                        ),
                                        SizedBox(
                                            height: size.height * 0.075,
                                            width: size.width * 0.16,
                                            child: const Card(
                                              color: bgBlack,
                                              shape: RoundedRectangleBorder(
                                                side:
                                                    BorderSide(color: btBrown),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.water_drop,
                                                    color: btBrown,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    "Milk",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: bgTxtWhite),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                        width: 150,
                                        height: size.height * 0.055,
                                        child: const Card(
                                          color: bgBlack,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: btBrown),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Medium Roasted",
                                            style: TextStyle(color: bgTxtWhite),
                                          )),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(fontSize: 18, color: bgTxtGrey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReadMoreText(
                      coffee.desc,
                      trimLines: 2,
                      trimLength: 90,
                      colorClickableText: btBrown,
                      style: const TextStyle(color: bgTxtWhite),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Size",
                      style: TextStyle(fontSize: 16, color: bgTxtGrey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cupSize(
                              0,
                              text: "S",
                            ),
                            cupSize(
                              1,
                              text: "M",
                            ),
                            cupSize(2, text: "L"),
                          ]),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(color: bgTxtGrey),
                            ),
                            Text(
                              "R ${coffee.price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: bgTxtWhite),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 250,
                          height: 55,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: btBrown),
                              onPressed: () {},
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cupSize(int index, {required String text}) {
    return InkWell(
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: cupIndex == index ? bgBlack : bgOnn,
              elevation: 0,
              shape: cupIndex == index
                  ? const RoundedRectangleBorder(
                      side: BorderSide(color: bgOutline),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  : null,
              child: SizedBox(
                width: 110,
                height: 35,
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(
                      color: cupIndex == index ? bgOutline : bgTxtWhite),
                )),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        onTap: () {});
  }
}
