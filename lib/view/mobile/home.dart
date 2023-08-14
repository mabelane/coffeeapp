import 'package:animations/animations.dart';
import 'package:coffeeapp/util/coffee_container.dart';
import 'package:coffeeapp/util/constants/colors_dark.dart';
import 'package:coffeeapp/util/detailed_page.dart';
import 'package:coffeeapp/view/mobile/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/Coffee.dart';
import '../../util/providers/coff_provider.dart';

class Home extends ConsumerWidget {
  final int coffeeIndex = 0;
  final style = const TextStyle(
      color: bgTxtWhite, fontSize: 36, fontWeight: FontWeight.bold);

  final special = const TextStyle(
      color: bgTxtWhite, fontSize: 20, fontWeight: FontWeight.bold);
  final List<String> _coffee = [
    "Cappuccino",
    "Espresso",
    "Latte",
    "Flat White",
    "Mocha",
    "Coffee",
  ];

  Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var scrSize = MediaQuery.of(context).size;
    final capp = ref.watch(coffeeDataProvider);
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find the best",
                    style: style,
                  ),
                  Text(
                    "Coffee for you",
                    style: style,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: navyblue,
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded),
                  fillColor: bgOnn,
                  hintText: "Find your coffee",
                  hintStyle: const TextStyle(
                    color: bgGrey,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: const OutlineInputBorder(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: _coffee.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        ontap: () {},
                        type: _coffee[index],
                        cColor: coffeeIndex == index ? btBrown : bgTxtWhite);
                  }),
            ),
            SizedBox(
                height: 295,
                child: capp.when(
                    data: (capp) {
                      List<Coffee> cappList = capp.map((e) => e).toList();
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: cappList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return OpenContainer(
                              clipBehavior: Clip.none,
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              closedColor: Colors.transparent,
                              openColor: Colors.transparent,
                              transitionType: ContainerTransitionType.fade,
                              closedBuilder: (context, openContainer) {
                                return CoffeeContainer(
                                  coffee: cappList[index],
                                  onTap: openContainer,
                                );
                              },
                              openBuilder: (context, action) {
                                return DetailedPage(
                                  coffee: cappList[index],
                                );
                              },
                            );
                          });
                    },
                    error: (error, s) => Text(error.toString()),
                    loading: () => const SizedBox())),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Special for you",
                style: special,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: scrSize.height * 0.155,
              decoration: BoxDecoration(
                  color: containerBlack,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: scrSize.width * 0.35,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Image(
                          image: AssetImage("lib/img/capp_oatmilk.webp"),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Flexible(
                    child: Text(
                      "5 Coffee Beans You Must Try!",
                      style: TextStyle(
                          color: bgTxtWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
