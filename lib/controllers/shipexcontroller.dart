import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttermaritime/views/celebrate.dart';
import 'package:fluttermaritime/views/theshipex.dart';

import '../model.dart';

class ShipExController extends StatefulWidget {
  final Model model;
  const ShipExController({super.key, required this.model});

  @override
  State<ShipExController> createState() => _ShipExControllerState();
}

class _ShipExControllerState extends State<ShipExController> {

  @override
  void initState() {
    super.initState();
    widget.model.initGame();
  }

  void nextShip(BuildContext context) {
      if (widget.model.currentIndex == widget.model.shiplist.length - 1) {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => Celebrate(model: widget.model, goBack: goBack))));
      } else {
        setState(() {
          widget.model.incrementIndex();
          widget.model.shuffleWithCurrentIndex();
          widget.model.incrementProgress();
        });
      }
  }

  void onAccept(ShipPart dragged, ShipPart target) {
    setState(() {
      widget.model.onAccept(dragged, target);
    });
  }

  void goBack(BuildContext context){
    Navigator.popUntil(context, (route) => route.isFirst);
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
    return ShipExercise(model: widget.model, goBack: goBack, onAccept: onAccept, nextShip: nextShip, speakTts: speakTts);
  }

}