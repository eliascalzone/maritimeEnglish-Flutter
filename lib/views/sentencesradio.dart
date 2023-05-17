import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model.dart';

class Radiosentences extends StatelessWidget {
  final Model model;
  final void Function(String) filter;
  final void Function(String) speakTts;

  const Radiosentences(
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
              left: 30.sp, right: 30.sp, top: 20.sp, bottom: 20.sp),
          child: Column(children: [
            TextField(
              onChanged: (value) => filter(value),
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
                child: model.foundSentences.isNotEmpty
                    ? ListView.builder(
                        itemCount: model.foundSentences.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            key: ValueKey(model.foundSentences[index]),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 1,
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () {
                                  speakTts(model.foundSentences[index]['data']);
                                },
                                icon: Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromRGBO(76, 146, 219, 1.0),
                                  size: 24.sp,
                                ),
                              ),
                              title: Text(
                                model.foundSentences[index]['data'],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              subtitle: Text(
                                model.foundSentences[index]['topic'],
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
