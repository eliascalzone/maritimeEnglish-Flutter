import 'package:flutter/material.dart';
import '../data/allwordslist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Phrasesmcp extends StatefulWidget {
  const Phrasesmcp({Key? key}) : super(key: key);

  @override
  State<Phrasesmcp> createState() => _PhrasesmcpState();
}

class _PhrasesmcpState extends State<Phrasesmcp> {
  final List<Map<String, dynamic>> _allwords = List.from(allwords);
  List<Map<String, dynamic>> _foundwords = [];
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _foundwords = _allwords;
  }

  void _filter(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = _allwords;
    } else {
      results = _allwords
          .where((element) =>
              element['name'].toLowerCase().startsWith(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundwords = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
      appBar: AppBar(
        title: const Text('General Terms'),
        titleTextStyle: Theme.of(context).textTheme.headline3,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: 20.sp, left: 30.sp, right: 30.sp, bottom: 20.sp),
          child: Column(children: [
            TextField(
              onChanged: (value) => _filter(value),
              decoration: InputDecoration(
                hintText: 'Search phrase list starting with ... ',
                labelStyle: const TextStyle(color: Colors.blue),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
            Expanded(
                child: _foundwords.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundwords.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            key: ValueKey(_foundwords[index]),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 1,
                            child: ListTile(
                              title: Row(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await flutterTts.setLanguage("en-US");
                                        await flutterTts.setSpeechRate(0.5);
                                        await flutterTts.setVolume(1.0);
                                        await flutterTts.setPitch(1);
                                        await flutterTts
                                            .speak(_foundwords[index]['name']);
                                      },
                                      icon: Icon(
                                        Icons.volume_up_rounded,
                                        color:
                                            Color.fromRGBO(76, 146, 219, 1.0),
                                        size: 24.sp,
                                      )),
                                  Text(
                                    _foundwords[index]['name'],
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                _foundwords[index]['mean'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          );
                        })
                    : const Center(child: Text('Nothing Found')))
          ]),
        ),
      ),
    );
  }
}
