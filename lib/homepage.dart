import 'package:flutter/material.dart';
import 'package:fluttermaritime/glossarypage.dart';
import 'package:fluttermaritime/radiocompage.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var animate = Lottie.network(
        'https://assets5.lottiefiles.com/packages/lf20_gfngwjbu.json',
        height: 270.h);
    var welcomeText = Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Welcome!',
          style: Theme.of(context).textTheme.headline2,
        ));
    /*var icon_next = Icon(Icons.arrow_forward_ios_rounded,
        color: Color.fromRGBO(251, 127, 46, 1), size: 20.sp);*/
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.only(top: 20.sp, left: 30.sp, right: 30.sp),
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
              SingleChildScrollView(
                child: Column(children: [
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
                      child: Container(
                        padding: EdgeInsets.only(right: 10.sp, left: 10.sp),
                        width: 370.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ]),
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
                                style: Theme.of(context).textTheme.headline2,
                              )),
                              //icon_next
                            ]),
                      )),
                  SizedBox(height: 8.h),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Radiocompage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        width: 370.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ]),
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
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              //icon_next
                            ]),
                      ))
                ]),
              )
            ],
          )),
    ));
  }
}
