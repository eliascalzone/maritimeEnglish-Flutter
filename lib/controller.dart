import 'package:flutter/material.dart';
import 'package:fluttermaritime/model.dart';
import 'package:fluttermaritime/views/rootpage.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  Model model = Model();

  void changePage(int newPage){
    setState(() {
      model.changePage(newPage);
    });
  }

  void onStateChanged(bool isDarkModeEnable) {
    setState(() {
      model.enableDarkMode(isDarkModeEnable);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RootPage(model: model, changePage: changePage);
  }
}