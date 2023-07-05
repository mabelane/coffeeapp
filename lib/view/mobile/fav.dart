import 'package:flutter/material.dart';

class FavouriteUI extends StatelessWidget {
  const FavouriteUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blueGrey,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                child: Text("GO"),
              );
            }),
      ),
    );
  }
}
