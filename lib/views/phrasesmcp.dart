import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/models/phrasesmodel.dart';

class Phrasesmcp extends StatelessWidget {
  final PhrasesModel model;
  final void Function(String) filter;
  final void Function(String) speakTts;

  const Phrasesmcp(
      {super.key,
      required this.model,
      required this.filter,
      required this.speakTts});

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
              onChanged: (value) => filter(value),
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
                child: model.foundwords.isNotEmpty
                    ? ListView.builder(
                        itemCount: model.foundwords.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            key: ValueKey(model.foundwords[index]),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 1,
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    model.foundwords[index]['name'],
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        speakTts(
                                            model.foundwords[index]['name']);
                                      },
                                      icon: const Icon(Icons.volume_up_rounded,
                                          color: Color.fromRGBO(
                                              76, 146, 219, 1.0)))
                                ],
                              ),
                              subtitle: Text(
                                model.foundwords[index]['mean'],
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
