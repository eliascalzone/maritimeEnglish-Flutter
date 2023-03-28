import 'package:flutter/material.dart';
import 'package:fluttermaritime/celebrate.dart';
import 'package:fluttermaritime/radiocompage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttermaritime/materialdesign.dart';
import 'package:audioplayers/audioplayers.dart';

class Shippage1 extends StatefulWidget {
  const Shippage1({super.key});

  @override
  State<Shippage1> createState() => _Shippage1State();
}

class _Shippage1State extends State<Shippage1> {
  AudioCache audioCache = AudioCache();
  //Body variable
  final titleText = const Text(
    'Type the matching word',
    style: textstyle_h2_black,
  );
  var image = Image.asset('images/shipnextexe.png');
  var box = const SizedBox(
    height: 8,
  );
  //Method variable
  String _name12 = 'a';
  String _name22 = 'c';
  String _name32 = 'd';
  String _name42 = 'b';
  String message2 = '';
  TextEditingController controller12 = TextEditingController();
  TextEditingController controller22 = TextEditingController();
  TextEditingController controller32 = TextEditingController();
  TextEditingController controller42 = TextEditingController();

  bool checkanswer1() {
    return controller12.text.toLowerCase() == _name12.toLowerCase();
  }

  bool checkanswer2() {
    return controller22.text.toLowerCase() == _name22.toLowerCase();
  }

  bool checkanswer3() {
    return controller32.text.toLowerCase() == _name32.toLowerCase();
  }

  bool checkanswer4() {
    return controller42.text.toLowerCase() == _name42.toLowerCase();
  }

  void _submit2() {
    List<String> incorrectAnswers2 = [];
    if (!checkanswer1()) {
      incorrectAnswers2.add('Superstructure - A');
    }
    if (!checkanswer2()) {
      incorrectAnswers2.add('Anchor - C');
    }
    if (!checkanswer3()) {
      incorrectAnswers2.add('Bow - D');
    }
    if (!checkanswer4()) {
      incorrectAnswers2.add('Portside - B');
    }
    if (incorrectAnswers2.isEmpty) {
      message2 = 'Amazing!!';
      audioCache.play('correct.wav');
    } else {
      message2 = 'Incorrect: \n' + '\n' + incorrectAnswers2.join('\n');
      audioCache.play('incorrect.mp3');
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
            actionsAlignment: MainAxisAlignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Text(message2),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  if (message2 == 'Amazing!!') {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Celebrate()),
                      );
                    });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const Celebrate()),
                        ));
                  }
                },
                child: const Text(
                  'GOT IT',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(251, 127, 46, 1.0)),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('THE SHIP'),
          titleTextStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          leading: IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      title: const Text(
                        'Are you sure you want to quit?',
                        style: TextStyle(
                            color: Color.fromRGBO(76, 146, 219, 1.0),
                            fontWeight: FontWeight.bold),
                      ),
                      content: const Text(
                          'All progress in this section will be lost'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text(
                              'CANCEL',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Radiocompage()),
                                  (route) => route.isFirst);

                              /*Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);*/
                            },
                            child: const Text(
                              'YES',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
            icon: const Icon(Icons.close),
          ),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    title: titleText),
                image,
                box_height20,
                Column(children: [
                  SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Center(
                              child: Text(
                            'Superstructure',
                            style: body_text,
                          )),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: controller12,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(4.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                  box,
                  SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Center(child: Text('Anchor', style: body_text)),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: controller22,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(4.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                  box,
                  SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Center(
                              child: Text(
                            'Bow',
                            style: body_text,
                          )),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: controller32,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(4.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                  box,
                  SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Center(
                              child: Text(
                            'Portside',
                            style: body_text,
                          )),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: controller42,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(4.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ))
                ]),
                ElevatedButton(
                  onPressed: () {
                    _submit2();
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size(
                        MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.05,
                      )),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  child: const Text(
                    'CHECK',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
        ));
  }
}
