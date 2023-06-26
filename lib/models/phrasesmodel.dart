import '../data/allwordslist.dart';

class PhrasesModel {
  List<Map<String, dynamic>> _foundwords = [];

  List<Map<String, dynamic>> get foundwords => _foundwords;

  void filterPhrases(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = allWordsList;
    } else {
      results = allWordsList
          .where((element) =>
              element['name']!.toLowerCase().startsWith(key.toLowerCase()))
          .toList();
    }
    _foundwords = results;
  }

  void initFoundwords() {
    _foundwords = allWordsList;
  }
}