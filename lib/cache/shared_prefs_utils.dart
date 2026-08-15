import 'package:shared_preferences/shared_preferences.dart';

// todo save data => write data
Future<void> saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  // todo get list from shared prefs
  List<String> mostRecentList = sharedPrefs.getStringList('most_recent') ?? [];
  //todo duplicate
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    // todo add suraIndex in mostRecentList
    mostRecentList.insert(0, '$newSuraIndex');
  }

  // todo limit
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }
  // todo save suraIndex
  await sharedPrefs.setStringList('most_recent', mostRecentList);
  // todo save suraIndex in one mostRecent
  //  await sharedPrefs.setStringList(
  //     'most_recent',
  //     ['$newSuraIndex'],
  //   );
}
