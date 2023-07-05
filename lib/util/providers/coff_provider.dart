import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/Coffee.dart';
import '../services/api_services.dart';

final coffeeDataProvider = FutureProvider<List<Coffee>>((ref) async {
  return ref.watch(coffeeProvider).getCoffee();
});
