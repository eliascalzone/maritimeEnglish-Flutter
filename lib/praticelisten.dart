import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttermaritime/allwordslist.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Practicelisten extends StatefulWidget {
  const Practicelisten({super.key});

  @override
  State<Practicelisten> createState() => _PracticelistenState();
}

class _PracticelistenState extends State<Practicelisten> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  final audioPlayer = AudioPlayer();
  String? latestFile;

  Future record() async {
    if (!isRecorderReady) {
      return;
    }

    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) {
      return;
    }

    final path = await recorder.stopRecorder();
    latestFile = path!;
  }

  @override
  void initState() {
    super.initState();

    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();

    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();
    isRecorderReady = true;
  }

  final List<Map<String, dynamic>> _list = List.from(allwords);
  int currentIndex = 0;
  var textstyle_alphabet = TextStyle(
    color: const Color.fromRGBO(76, 146, 219, 1.0),
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static const indexArr = [
    0,
    5,
    13,
    28,
    42,
    48,
    56,
    60,
    65,
    70,
    71,
    79,
    85,
    86,
    94,
    98,
    107,
    131,
    139,
    143,
    148,
    153
  ];
  static const letterArr = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'L',
    'M',
    'N',
    'O',
    'P',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W'
  ];

  Color letterColor(int index) {
    if (currentIndex >= indexArr[index] && currentIndex < indexArr[index + 1]) {
      return const Color.fromARGB(30, 33, 149, 243);
    } else {
      return const Color.fromARGB(0, 33, 149, 243);
    }
  }

  List<Widget> upperButtons() {
    List<Widget> list = [];
    for (int i = 0; i < 21; i++) {
      list.add(TextButton(
        onPressed: () {
          setState(() {
            currentIndex = indexArr[i];
          });
        },
        style: TextButton.styleFrom(backgroundColor: letterColor(i)),
        child: Text(
          letterArr[i],
          style: textstyle_alphabet,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
      appBar: AppBar(
        title: const Text('Practice Listening'),
        titleTextStyle: Theme.of(context).textTheme.headline3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
            height: 50.sp,
            child: ListView(
                scrollDirection: Axis.horizontal, children: upperButtons()),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.only(right: 30.sp, left: 30.sp, bottom: 20.sp),
            width: MediaQuery.of(context).size.width * 0.86,
            height: MediaQuery.of(context).size.height * 0.60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
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
                      SizedBox(height: 20.sp),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40.sp,
                            height: 40.sp,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.volume_up_rounded,
                                  size: 30.sp,
                                  color:
                                      const Color.fromRGBO(76, 146, 219, 1.0),
                                )),
                          ),
                          Expanded(
                            child: Text(
                              _list[currentIndex]['name'],
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Definitions: ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Text(
                        _list[currentIndex]['mean'],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                    ],
                  ),
                ),

                /* Playback button */
                Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () async {
                          await audioPlayer.play(latestFile!, isLocal: true);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(10.sp),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 20.sp,
                        ))),
                Row(
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
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(10.sp),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20.sp,
                      ),
                    ),

                    /* Record Button */
                    ElevatedButton(
                        onPressed: () async {
                          if (recorder.isRecording) {
                            await stop();
                          } else {
                            await record();
                          }
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(10.sp),
                        ),
                        child: Icon(
                          recorder.isRecording ? Icons.stop : Icons.mic,
                          size: 50.sp,
                        )),

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
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(10.sp),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
