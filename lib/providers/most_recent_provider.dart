import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  // todo data
  List<int> mostRecentList = [];

  // todo get data => read data
  void getMostRecentList() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    List<String> mostRecentListAsString =
        sharedPrefs.getStringList('most_recent') ?? [];

    // todo List<String> => List<int>
    // ['1', '2'] => [1, 2]
    mostRecentList = mostRecentListAsString
        .map((element) => int.parse(element))
        .toList();

    //return mostRecentListAsInt.reversed.toList();

    notifyListeners();
  }
}
