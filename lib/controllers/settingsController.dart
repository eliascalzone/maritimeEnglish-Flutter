import 'package:flutter/material.dart';
import 'package:fluttermaritime/main.dart';
import 'package:fluttermaritime/models/usermodel.dart';
import 'package:fluttermaritime/views/about.dart';
import 'package:fluttermaritime/views/settingspage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../preferences.dart';

class SettingsController extends StatefulWidget {
  final UserModel model;

  const SettingsController({super.key, required this.model});

  @override
  State<SettingsController> createState() => _SettingsControllerState();
}

class _SettingsControllerState extends State<SettingsController> {

  Future launchURL() async {
    const url =
        'https://www.imo.org/en/OurWork/Safety/Pages/StandardMarineCommunicationPhrases.aspx';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void goToAbout(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const About()));
  }

  Future<void> enableDarkMode(bool value) async {
    setState(() {
      widget.model.enableDarkMode(value);
    });
    await Preferences.setDarkMode(value);
  }

  void reloadApp(BuildContext context){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MyApp(
                  model: widget.model,
                )),
        (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Settings(
        model: widget.model,
        launchUrl: launchURL,
        goToAbout: goToAbout,
        enableDarkMode: enableDarkMode,
        reloadApp: reloadApp);
  }
}
