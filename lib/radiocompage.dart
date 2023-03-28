import 'package:flutter/material.dart';
import 'package:fluttermaritime/settingspage.dart';
import 'package:fluttermaritime/shippage.dart';
import 'package:fluttermaritime/materialdesign.dart';

class Radiocompage extends StatelessWidget {
  const Radiocompage({super.key});

  @override
  Widget build(BuildContext context) {
    var images1 = Image.asset('images/radio_general_phrases.png');
    var images2 = Image.asset('images/radio_theship.png');
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
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
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Column(
              children: [
                GestureDetector(
                    onTap: () {
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Phrasesmcp()));*/
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      width: MediaQuery.of(context).size.width * 0.86,
                      height: MediaQuery.of(context).size.height * 0.26,
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
                              'Here is where you can find general phrases for Radio Communication',
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
                              builder: (context) => Shippage(
                                    onSubmit: (String value) {},
                                  )));
                    },
                    child: Container(
                      // color: Color.fromRGBO(235, 239, 245, 1.0),
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      width: MediaQuery.of(context).size.width * 0.86,
                      height: MediaQuery.of(context).size.height * 0.26,
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
                              'The Ship',
                              style: textstyle_h2_blue,
                            ),
                            subtitle: Text(
                              'Here is where you can learn about the names of different parts of the ship',
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
