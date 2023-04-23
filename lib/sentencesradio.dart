import 'package:flutter/material.dart';
import 'package:fluttermaritime/allwordslist.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Radiosentences extends StatefulWidget {
  const Radiosentences({Key? key}) : super(key: key);

  @override
  State<Radiosentences> createState() => _RadiosentencesState();
}

class _RadiosentencesState extends State<Radiosentences> {
  final FlutterTts flutterTts = FlutterTts();
  final List<Map<String, dynamic>> _all_sentences = List.from(all_sentences);
  List<Map<String, dynamic>> _foundsentences = [];

  @override
  void initState() {
    super.initState();
    _foundsentences = _all_sentences;
  }

  void _filter(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = _all_sentences;
    } else {
      results = _all_sentences
          .where((element) =>
              element['topic'].toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundsentences = results;
    });
  }

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
              left: 30.sp, right: 30.sp, top: 20.sp, bottom: 20.sp),
          child: Column(children: [
            TextField(
              onChanged: (value) => _filter(value),
              decoration: InputDecoration(
                hintText: 'Search for topic ... ',
                labelStyle: const TextStyle(color: Colors.blue),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 30.sp,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
            Expanded(
                child: _foundsentences.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundsentences.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            key: ValueKey(_foundsentences[index]),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 1,
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () async {
                                  await flutterTts.setLanguage("en-US");
                                  await flutterTts.setSpeechRate(0.5);
                                  await flutterTts.setVolume(1.0);
                                  await flutterTts.setPitch(1);
                                  await flutterTts
                                      .speak(_foundsentences[index]['data']);
                                },
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromRGBO(76, 146, 219, 1.0),
                                ),
                              ),
                              title: Text(
                                _foundsentences[index]['data'],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              subtitle: Text(
                                _foundsentences[index]['topic'],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
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
