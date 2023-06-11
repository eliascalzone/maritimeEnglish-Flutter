import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model.dart';

class Practicelisten extends StatelessWidget {
  final Model model;
  final void Function(int) setIndex;
  final void Function() playLatestFile;
  final void Function() record;
  final void Function(String) speakTts;
  final void Function() clearPath;

  const Practicelisten(
      {super.key,
      required this.model,
      required this.setIndex,
      required this.playLatestFile,
      required this.record,
      required this.speakTts,
      required this.clearPath});

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

  List<Widget> upperButtons() {
    List<Widget> list = [];
    for (int i = 0; i < 21; i++) {
      list.add(TextButton(
        onPressed: () {
          setIndex(indexArr[i]);
        },
        style: TextButton.styleFrom(
            backgroundColor:
                (model.allwords[model.listenIndex]['name']![0] == letterArr[i])
                    ? const Color.fromARGB(30, 33, 149, 243)
                    : const Color.fromARGB(0, 33, 149, 243)),
        child: Text(
          letterArr[i],
          style: TextStyle(
            color: const Color.fromRGBO(76, 146, 219, 1.0),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
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
                                onPressed: () {
                                  speakTts(model.allwords[model.listenIndex]
                                      ['name']!);
                                },
                                icon: Icon(
                                  Icons.volume_up_rounded,
                                  size: 30.sp,
                                  color:
                                      const Color.fromRGBO(76, 146, 219, 1.0),
                                )),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Expanded(
                            child: Text(
                              model.allwords[model.listenIndex]['name']!,
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
                        model.allwords[model.listenIndex]['mean']!,
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
                        onPressed: () {
                          playLatestFile();
                        },
                        style: model.latestFile == ''
                            ? ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(10.sp),
                              )
                            : ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(10.sp),
                                backgroundColor: Colors.green
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
                        if (model.listenIndex == 0) {
                          setIndex(model.allwords.length - 1);
                        } else {
                          setIndex(model.listenIndex - 1);
                        }
                        clearPath();
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
                        onPressed: () {
                          clearPath();
                          record();
                        },
                        style: model.isRecording
                            ? ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(10.sp),
                                backgroundColor: Colors.red)
                            : ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(10.sp)),
                        child: Icon(
                          model.isRecording ? Icons.stop : Icons.mic,
                          size: 50.sp,
                        )),

                    /* Next Button */
                    OutlinedButton(
                      onPressed: () {
                        setIndex(model.listenIndex + 1);
                        if (model.listenIndex >= model.allwords.length) {
                          setIndex(0);
                        }
                        clearPath();
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
