import 'package:flutter/material.dart';
import 'package:fluttermaritime/glossarypage.dart';
import 'package:fluttermaritime/radiocompage.dart';
import 'package:fluttermaritime/settingspage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Expanded(flex: 0, child: Image.asset('images/homeimage.png')),
          const Padding(
              padding: EdgeInsets.only(
            top: 20,
          )),
          const Expanded(
              flex: 0,
              child: Text(
                'What should we learn today?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(
            top: 20,
          )),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Glossarypage()));
              },
              child: Image.asset('images/glossarySMCP.png'),
            ),
          ),
          Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Radiocompage()));
                },
                child: Image.asset('images/radiocom.png'),
              ))
        ]),
      ),
    );
  }
}
