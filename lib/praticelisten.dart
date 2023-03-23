import 'package:flutter/material.dart';
import 'package:fluttermaritime/allwordslist.dart';

class Practicelisten extends StatefulWidget {
  const Practicelisten({super.key});

  @override
  State<Practicelisten> createState() => _PracticelistenState();
}

class _PracticelistenState extends State<Practicelisten> {
  final List<Map<String, dynamic>> _list = List.from(allwords);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PRACTICE LISTENING'),
          titleTextStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  width: 370,
                  height: 587,
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
                  child: Column(children: [
                    Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            _list[currentIndex]['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Text(
                          _list[currentIndex]['mean'],
                          style: const TextStyle(fontSize: 16),
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex++;
                                if (currentIndex >= _list.length) {
                                  currentIndex = 0;
                                }
                              });
                            },
                            child: Image.asset('images/nextbutton.png')))
                  ]),
                ))));
  }
}
