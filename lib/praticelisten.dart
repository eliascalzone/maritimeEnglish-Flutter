import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttermaritime/allwordslist.dart';
import 'package:fluttermaritime/materialdesign.dart';

class Practicelisten extends StatefulWidget {
  const Practicelisten({super.key});

  @override
  State<Practicelisten> createState() => _PracticelistenState();
}

class _PracticelistenState extends State<Practicelisten> {
  final List<Map<String, dynamic>> _list = List.from(allwords);
  int currentIndex = 0;
  static const textstyle_alphabet = TextStyle(
    color: Color.fromRGBO(76, 146, 219, 1.0),
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

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
                    currentIndex = 0;
                  });
                },
                child: const Text(
                  "A",
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 10;
                  });
                },
                child: const Text(
                  "B",
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 20;
                  });
                },
                child: const Text(
                  "C",
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 30;
                  });
                },
                child: const Text(
                  "D",
                  style: textstyle_alphabet,
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 40;
                  });
                },
                child: const Text(
                  "E",
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
              Container(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset('images/hearing.png'),
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentIndex == 0) {
                              currentIndex = _list.length - 1;
                            } else {
                              currentIndex--;
                            }
                          });
                        },
                        child: Image.asset('images/backbutton.png'),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset('images/micro.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex++;
                            if (currentIndex >= _list.length) {
                              currentIndex = 0;
                            }
                          });
                        },
                        child: Image.asset('images/nextbutton.png'),
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
