import 'package:flutter/material.dart';
import 'package:fluttermaritime/models/usermodel.dart';
import 'package:fluttermaritime/views/glossarypage.dart';
import 'package:fluttermaritime/views/radiocompage.dart';
import 'package:fluttermaritime/controllers/phrasescontroller.dart';
import 'package:fluttermaritime/controllers/practicelistenController.dart';
import 'package:fluttermaritime/controllers/sentencesController.dart';
import 'package:fluttermaritime/controllers/shipexcontroller.dart';
import 'package:fluttermaritime/models/navigationmodel.dart';
import 'package:fluttermaritime/models/phrasesmodel.dart';
import 'package:fluttermaritime/models/recordingmodel.dart';
import 'package:fluttermaritime/models/sentencesmodel.dart';
import 'package:fluttermaritime/models/shipexmodel.dart';
import 'package:fluttermaritime/views/homepage.dart';

class NavigationController extends StatefulWidget {
  final NavigationModel model;
  final UserModel usermodel;
  const NavigationController({super.key, required this.model, required this.usermodel});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  void changeScreen(int newScreen) {
    setState(() {
      widget.model.changeScreen(newScreen);
    });
  }

  void goToStandardCom(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Glossarypage(
                goToPhrases: goToPhrases,
                goToPracticeListen: goToPracticeListen)));
  }

  void goToRadioCom(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Radiocompage(
                  goToRadioSentences: goToRadioSentences,
                  goToShipEx: goToShipEx,
                )));
  }

  void goToPhrases(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PhrasesController(model: PhrasesModel())));
  }

  void goToPracticeListen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PracticelistenController(model: RecordingModel())));
  }

  void goToRadioSentences(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SentencesController(model: SentencesModel())));
  }

  void goToShipEx(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShipExController(model: ShipExModel(), usermodel: widget.usermodel)));
  }

  void goBack(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Homepage(
        model: widget.model,
        goToStandardCom: goToStandardCom,
        goToRadioCom: goToRadioCom,
        changeScreen: changeScreen, usermodel: widget.usermodel);
  }
}
