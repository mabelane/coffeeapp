import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/Coffee.dart';

class ApiServices {
  Future<List<Coffee>> getCoffee() async {
    final response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/mabelane/maui_coffee/main/maui_coffee/Resources/Raw/coffeedata.json"));

    if (response.statusCode == 200) {
      final coffeeData = json.decode(response.body);
      var coffeeItems = coffeeData as List<dynamic>;

      return coffeeItems.map((e) => Coffee.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Coffee');
    }
  }
}

final coffeeProvider = Provider<ApiServices>((ref) => ApiServices());
