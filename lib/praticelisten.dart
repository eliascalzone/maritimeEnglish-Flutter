import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttermaritime/allwordslist.dart';
import 'package:fluttermaritime/materialdesign.dart';
import 'package:record/record.dart';

class Practicelisten extends StatefulWidget {
  const Practicelisten({super.key});

  @override
  State<Practicelisten> createState() => _PracticelistenState();
}

class _PracticelistenState extends State<Practicelisten> {
  final record = Record();
  String recPath = '';
  bool isRecording = false;

  final List<Map<String, dynamic>> _list = List.from(allwords);
  int currentIndex = 0;
  static const textstyle_alphabet = TextStyle(
    color: Color.fromRGBO(76, 146, 219, 1.0),
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  List<String> getLetter(){
    return ['A','B','C','D','E'];
  }

  List<int> getIndex(){
    return [0,5,13,28,42];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
      appBar: AppBar(
        title: const Text('PRACTICE LISTENING'),
        titleTextStyle:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = getIndex().elementAt(0);
                  });
                },
                child: Text(
                  getLetter().elementAt(0),
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = getIndex().elementAt(1);
                  });
                },
                child: Text(
                  getLetter().elementAt(1),
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = getIndex().elementAt(2);
                  });
                },
                child: Text(
                  getLetter().elementAt(2),
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = getIndex().elementAt(3);
                  });
                },
                child: Text(
                  getLetter().elementAt(3),
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = getIndex().elementAt(4);
                  });
                },
                child: Text(
                  getLetter().elementAt(4),
                  style: textstyle_alphabet,
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(right: 30, left: 30),
          width: MediaQuery.of(context).size.width * 0.86,
          height: MediaQuery.of(context).size.height * 0.63,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
              color: Colors.white),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              size: 30,
                              color: Color.fromRGBO(76, 146, 219, 1.0),
                            )),
                        Expanded(
                          child: Text(
                            _list[currentIndex]['name'],
                            style: textstyle_h1_black,
                          ),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See translation',
                            style: TextStyle(
                                color: Color.fromRGBO(76, 146, 219, 1.0),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      _list[currentIndex]['mean'],
                      style: body_text,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),

              /* Playback button */
              Container(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Play recording
                    },
                    style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                        ),
                    child: const Icon(Icons.play_arrow)
                  )),
    
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /* Previous Button */
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (currentIndex == 0) {
                              currentIndex = _list.length - 1;
                            } else {
                              currentIndex--;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                        ),
                        child: const Icon(Icons.arrow_back_ios_rounded),
                      ),

                      /* Record Button */
                      ElevatedButton(
                        onPressed: () async {
                          /*if(await record.isRecording()){
                            record.stop();
                          }
                          else {
                            if (await record.hasPermission()) {
                              await record.start(
                                //path: 'aFullPath/myFile.m4a',
                                encoder: AudioEncoder.aacLc,
                                bitRate: 128000,
                                samplingRate: 44100,
                              );
                            }
                          }*/
                          isRecording = await record.isRecording();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                        ),
                        child: Icon(
                          isRecording ? Icons.stop : Icons.mic, size: 60,)
                      ),

                      /* Next Button */
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex++;
                            if (currentIndex >= _list.length) {
                              currentIndex = 0;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                        ),
                        child: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
