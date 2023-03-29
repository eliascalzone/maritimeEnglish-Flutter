import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttermaritime/materialdesign.dart';
import 'package:fluttermaritime/radiocompage.dart';
import 'package:fluttermaritime/shippage1.dart';

class Shippage extends StatefulWidget {
  const Shippage({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<Shippage> createState() => _ShippageState();
}

class _ShippageState extends State<Shippage> {
  AudioCache audioCache = AudioCache();
  String _name1 = 'd';
  String _name2 = 'c';
  String _name3 = 'a';
  String _name4 = 'b';
  String message = '';

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  bool checkanswer1() {
    return controller1.text.toLowerCase() == _name1.toLowerCase();
  }

  bool checkanswer2() {
    return controller2.text.toLowerCase() == _name2.toLowerCase();
  }

  bool checkanswer3() {
    return controller3.text.toLowerCase() == _name3.toLowerCase();
  }

  bool checkanswer4() {
    return controller4.text.toLowerCase() == _name4.toLowerCase();
  }

  void _submit() {
    List<String> incorrectAnswers = [];
    if (!checkanswer1()) {
      incorrectAnswers.add('Deck - D');
    }
    if (!checkanswer2()) {
      incorrectAnswers.add('Propeller - C');
    }
    if (!checkanswer3()) {
      incorrectAnswers.add('Funnel - A');
    }
    if (!checkanswer4()) {
      incorrectAnswers.add('Stern - B');
    }
    if (incorrectAnswers.isEmpty) {
      message = 'Amazing!!';
      audioCache.play('correct.wav');
    } else {
      message = 'Incorrect: \n' + '\n' + incorrectAnswers.join('\n');
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
            //title: const Text('Result'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Shippage1()));
                },
                child: Text(
                  message == 'Amazing!!' ? 'CONTINUE' : 'GOT IT',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: message == 'Amazing!!'
                          ? Color.fromRGBO(76, 146, 219, 1.0)
                          : Color.fromRGBO(251, 127, 46, 1.0)),
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
          title: const Text('THE SHIP'),
          titleTextStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          automaticallyImplyLeading: false,
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
              const ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  title: Text(
                    'Type the matching word',
                    style: textstyle_h2_black,
                  )),
              Image.asset('images/shipexe.png'),
              box_height20,
              Column(children: [
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                            child: Text(
                          'Deck',
                          style: body_text,
                        )),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: controller1,
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
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                            child: Text(
                          'Propeller',
                          style: body_text,
                        )),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: controller2,
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
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                            child: Text(
                          'Funnel',
                          style: body_text,
                        )),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: controller3,
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
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                            child: Text(
                          'Stern',
                          style: body_text,
                        )),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: controller4,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(4.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ))
              ]),
              box_height20,
              ElevatedButton(
                onPressed: () {
                  _submit();
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
              ),
            ])));
  }
}
