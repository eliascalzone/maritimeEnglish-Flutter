import 'package:flutter/material.dart';
import 'package:fluttermaritime/phrasesmcp.dart';
import 'package:fluttermaritime/settingspage.dart';

class Glossarypage extends StatelessWidget {
  const Glossarypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GLOSSARY SMCP'),
        titleTextStyle:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      body: Center(
          child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Phrasesmcp()));
            },
            child: Image.asset('images/generalphrase.png'),
          ),
          GestureDetector(
            onTap: () {
              /* Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));*/
            },
            child: Image.asset('images/praticelisten.png'),
          )
        ],
      )),
    );
  }
}
