import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model.dart';

class Celebrate extends StatelessWidget {
  final Model model;
  final Function(BuildContext) goBack;

  const Celebrate({super.key, required this.model, required this.goBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LESSON COMPLETED!',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Lottie.asset('assets/welldone.json', height: 270.h),
                SizedBox(
                  height: 50.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      goBack(context);
                    },
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(280.w, 50.h)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.r)))),
                    child: Text(
                      'BACK TO HOME',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ));
  }
}
