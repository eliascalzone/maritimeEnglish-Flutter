import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttermaritime/models/phrasesmodel.dart';
import 'package:fluttermaritime/views/phrasesmcp.dart';

class PhrasesController extends StatefulWidget {
  final PhrasesModel model;
  const PhrasesController({super.key, required this.model});

  @override
  State<PhrasesController> createState() => _PhrasesControllerState();
}

class _PhrasesControllerState extends State<PhrasesController> {

  @override
  void initState() {
    super.initState();
    widget.model.initFoundwords();
  }

  void filter(String key){
    setState(() {
      widget.model.filterPhrases(key);
    });
  }

  final FlutterTts flutterTts = FlutterTts();

  void speakTts(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1);
    await flutterTts.speak(word);
  }
  
  @override
  Widget build(BuildContext context) {
    return Phrasesmcp(model: widget.model, filter: filter, speakTts: speakTts,);
  }
}