import 'package:flutter/material.dart';
import 'package:fluttermaritime/settingspage.dart';
import 'package:fluttermaritime/shippage.dart';

class Radiocompage extends StatelessWidget {
  const Radiocompage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RADIO COMMUNICATION'),
        titleTextStyle:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
          child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));*/
            },
            child: Image.asset('images/radiophrase.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Shippage(
                            onSubmit: (String value) {},
                          )));
            },
            child: Image.asset('images/theship.png'),
          )
        ],
      )),
    );
  }
}
