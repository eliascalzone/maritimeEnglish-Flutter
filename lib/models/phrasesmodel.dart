import '../data/allwordslist.dart';

class PhrasesModel {
  final List<Map<String, String>> _allwords = List.from(allWordsList);

  List<Map<String, String>> get allwords => _allwords;

  List<Map<String, dynamic>> _foundwords = [];

  List<Map<String, dynamic>> get foundwords => _foundwords;

  void filterPhrases(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = _allwords;
    } else {
      results = _allwords
          .where((element) =>
              element['name']!.toLowerCase().startsWith(key.toLowerCase()))
          .toList();
    }
    _foundwords = results;
  }

  void initFoundwords() {
    _foundwords = _allwords;
  }
}