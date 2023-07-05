import 'package:coffeeapp/model/Favourite.dart';
import 'package:flutter/material.dart';

class FavContainer extends StatelessWidget {
  const FavContainer({super.key, required this.favourite});
  final Favourite favourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Row(children: [
        SizedBox(
          child: Image(image: AssetImage(favourite.imgPath)),
        ),
        Column(
          children: [
            Text(favourite.title),
            Text(favourite.extras),
            Row(
              children: [
                Text(favourite.rating.toString()),
                Text(favourite.price.toString()),
              ],
            )
          ],
        )
      ]),
    );
  }
}
