import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Glossarypage extends StatelessWidget {
  final void Function(BuildContext) goToPhrases;
  final void Function(BuildContext) goToPracticeListen;

  const Glossarypage({super.key, required this.goToPhrases, required this.goToPracticeListen});

  @override
  Widget build(BuildContext context) {
    var images1 = Image.asset(
      'images/general_phrases.png',
      width: 370.w,
      height: 160.h,
    );
    var images2 = Image.asset('images/practicing_listen.png',
        width: 370.w, height: 160.h);
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
        appBar: AppBar(
          title: const Text('Standard Communication'),
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.headline3,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(
                left: 30.sp, right: 30.sp, top: 20.sp, bottom: 20.sp),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      goToPhrases(context);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: Column(children: [
                        images1,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 15.sp, right: 15.sp, bottom: 10.sp),
                            title: Text(
                              'General Phrases',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            subtitle: Text(
                              'Here is where you can find definitions for Standard Maritime Communication Phrases',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        )
                      ]),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                    onTap: () {
                      goToPracticeListen(context);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: Column(children: [
                        images2,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                              contentPadding: EdgeInsets.only(
                                  left: 15.sp, right: 15.sp, bottom: 10.sp),
                              title: Text(
                                'Practice Listening',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              subtitle: Text(
                                'Here is where you can listen and pratice Standard Maritime Communication Phrases',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                        ),
                      ]),
                    ))
              ],
            ),
          )),
        ));
  }
}
