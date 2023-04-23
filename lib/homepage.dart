import 'package:flutter/material.dart';
import 'package:fluttermaritime/glossarypage.dart';
import 'package:fluttermaritime/radiocompage.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var animate = Lottie.asset('assets/yacht.json',
        height: 270.h, width: double.infinity);
    var welcomeText = Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Welcome!',
          style: Theme.of(context).textTheme.headline2,
        ));
    var icon_next = Icon(Icons.arrow_forward_ios_rounded,
        color: Color.fromRGBO(251, 127, 46, 1), size: 20.sp);
    return Scaffold(
        appBar: AppBar(
          title: Text('MARITIME ENGLISH'),
          titleTextStyle: Theme.of(context).textTheme.headline3,
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(
                    top: 20.sp, left: 30.sp, right: 30.sp, bottom: 20.sp),
                child: Column(
                  children: [
                    welcomeText,
                    animate,
                    SizedBox(
                      height: 20.sp,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'What should we learn today?',
                          style: Theme.of(context).textTheme.headline1,
                        )),
                    Column(children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Glossarypage()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.sp,
                                top: 20.sp,
                                bottom: 20.sp,
                                right: 15.sp),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.auto_stories_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: 40.sp,
                                  ),
                                  SizedBox(
                                    width: 8.sp,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Standard Communication',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )),
                                  icon_next,
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Radiocompage()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.sp,
                                top: 20.sp,
                                bottom: 15.sp,
                                right: 15.sp),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.cell_tower_rounded,
                                    color: Color.fromRGBO(251, 127, 46, 1),
                                    size: 40.sp,
                                  ),
                                  SizedBox(
                                    width: 8.sp,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Radio Communication',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  icon_next
                                ]),
                          ),
                        ),
                      )
                    ]),
                  ],
                )),
          ),
        ));
  }
}
