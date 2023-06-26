import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttermaritime/models/sentencesmodel.dart';
import 'package:fluttermaritime/views/sentencesradio.dart';

class SentencesController extends StatefulWidget{
  final SentencesModel model;

  const SentencesController({super.key, required this.model});

  @override
  State<SentencesController> createState() => _SentencesControllerState();
}

class _SentencesControllerState extends State<SentencesController> {

  @override
  void initState() {
    super.initState();
    widget.model.initSentences();
  }

  void filter(String key){
    setState(() {
      widget.model.filterSentences(key);
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
    return Radiosentences(model: widget.model, filter: filter, speakTts: speakTts);
  }
}