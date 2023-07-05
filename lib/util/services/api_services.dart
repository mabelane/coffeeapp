import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/Coffee.dart';

class ApiServices {
  Future<List<Coffee>> getCoffee() async {
    final String response =
        await rootBundle.loadString("lib/json/internal_data.json");
    final coffeeData = await json.decode(response);
    var coffeeItems = coffeeData["Coffee"] as List<dynamic>;

    return coffeeItems.map((e) => Coffee.fromJson(e)).toList();
  }
}

final coffeeProvider = Provider<ApiServices>((ref) => ApiServices());
