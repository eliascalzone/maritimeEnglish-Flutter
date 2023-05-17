import 'package:flutter/material.dart';
import 'package:fluttermaritime/Views/glossarypage.dart';
import 'package:fluttermaritime/Views/radiocompage.dart';
import 'package:fluttermaritime/controllers/phrasescontroller.dart';
import 'package:fluttermaritime/controllers/practicelistenController.dart';
import 'package:fluttermaritime/controllers/sentencesController.dart';
import 'package:fluttermaritime/controllers/shipexcontroller.dart';
import 'package:fluttermaritime/model.dart';
import 'package:fluttermaritime/views/homepage.dart';

class NavigationController extends StatefulWidget {
  final Model model;
  const NavigationController({super.key, required this.model});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {

  void changeScreen(int newScreen) {
    setState(() {
      widget.model.changeScreen(newScreen);
    });
  }

  void goToStandardCom(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Glossarypage(model: widget.model, goToPhrases: goToPhrases, goToPracticeListen: goToPracticeListen)));
  }

  void goToRadioCom(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Radiocompage(model: widget.model, goToRadioSentences: goToRadioSentences, goToShipEx: goToShipEx)));
  }

  void goToPhrases(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PhrasesController(model: widget.model)));
  }

  void goToPracticeListen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PracticelistenController(model: widget.model)));
  }

  void goToRadioSentences(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SentencesController(model: widget.model)));
  }

  void goToShipEx(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ShipExController(model: widget.model)));
  }

  void goBack(BuildContext context){
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Homepage(model: widget.model, goToStandardCom: goToStandardCom, goToRadioCom: goToRadioCom, changeScreen: changeScreen);
  }
}
