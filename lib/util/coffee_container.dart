import 'dart:ui';

import 'package:coffeeapp/util/constants/colors_dark.dart';
import 'package:coffeeapp/view/blur_effect.dart';
import 'package:flutter/material.dart';

import '../model/Coffee.dart';

class CoffeeContainer extends StatelessWidget {
  const CoffeeContainer(
      {super.key,
      required this.coffee,
      required this.onTap});
  final Coffee coffee;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 170,
      decoration: BoxDecoration(
          color: containerBlack, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.topRight, children: [
            SizedBox(
              width: 195,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: onTap,
                  child: Image.network(
                    coffee.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            BlurEffect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(25)),
              width: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: btBrown,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      coffee.rating.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ]),
            )
          ]),
          const SizedBox(
            height: 15,
          ),
          Text(
            coffee.title,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            coffee.extras,
            maxLines: 1,
            style: const TextStyle(color: bgTxtGrey, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "R ${coffee.price.toStringAsFixed(2)}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: Card(
                  color: btBrown,
                  child: InkWell(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
