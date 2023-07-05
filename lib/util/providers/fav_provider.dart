
import 'package:coffeeapp/model/Favourite.dart';
import 'package:riverpod/riverpod.dart';

class FavProvider extends StateNotifier<List<Favourite>> {
  FavProvider() : super([]);
}
