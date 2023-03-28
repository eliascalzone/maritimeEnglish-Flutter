import 'package:flutter/material.dart';
import 'package:fluttermaritime/materialdesign.dart';
import 'package:fluttermaritime/phrasesmcp.dart';
import 'package:fluttermaritime/praticelisten.dart';
import 'package:fluttermaritime/settingspage.dart';

class Glossarypage extends StatelessWidget {
  const Glossarypage({super.key});

  @override
  Widget build(BuildContext context) {
    var images1 = Image.asset('images/general_phrases.png');
    var images2 = Image.asset('images/practicing_listen.png');
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
        appBar: AppBar(
          title: const Text('STANDARD COMMUNICATION'),
          titleTextStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Phrasesmcp()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      width: MediaQuery.of(context).size.width * 0.86,
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: Column(children: [
                        images1,
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 1),
                            title: Text(
                              'General Phrases',
                              style: textstyle_h2_blue,
                            ),
                            subtitle: Text(
                              'Here is where you can find definitions for Standard Maritime Communication Phrases',
                              style: body_text,
                            ),
                          ),
                        )
                      ]),
                    )),
                box_height20,
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Practicelisten()));
                    },
                    child: Container(
                      // color: Color.fromRGBO(235, 239, 245, 1.0),
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      width: MediaQuery.of(context).size.width * 0.86,
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: Column(children: [
                        images2,
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 1),
                            title: Text(
                              'Praticing Listening',
                              style: textstyle_h2_blue,
                            ),
                            subtitle: Text(
                              'Here is where you can listen and pratice Standard Maritime Communication Phrases',
                              style: body_text,
                            ),
                          ),
                        )
                      ]),
                    ))
              ],
            )
          ],
        ));
  }
}
