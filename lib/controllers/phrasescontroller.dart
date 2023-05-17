import 'package:flutter/material.dart';
import 'package:fluttermaritime/views/phrasesmcp.dart';

import '../model.dart';

class PhrasesController extends StatefulWidget {
  final Model model;
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
  
  @override
  Widget build(BuildContext context) {
    return Phrasesmcp(model: widget.model, filter: filter);
  }
}