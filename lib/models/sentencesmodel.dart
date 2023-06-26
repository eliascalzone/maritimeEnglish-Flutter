import 'package:fluttermaritime/data/allwordslist.dart';

class SentencesModel {

  List<Map<String, dynamic>> _foundSentences = [];

  List<Map<String, dynamic>> get foundSentences => _foundSentences;

  void initSentences() {
    _foundSentences = all_sentences;
  }

  void filterSentences(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = all_sentences;
    } else {
      results = all_sentences
          .where((element) =>
              element['topic'].toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    _foundSentences = results;
  }
}