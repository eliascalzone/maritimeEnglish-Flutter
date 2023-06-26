import 'package:flutter/material.dart';
import 'package:fluttermaritime/models/usermodel.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/models/shipexmodel.dart';

class Celebrate extends StatelessWidget {
  final ShipExModel model;
  final UserModel usermodel;
  final Function(BuildContext) goBack;

  const Celebrate({super.key, required this.model, required this.goBack, required this.usermodel});

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
                  height: 10.h,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Score: ",
                      style: TextStyle(
                          color: Color.fromRGBO(75, 219, 78, 1),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "${model.score} / 50",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold))
                ])),
                SizedBox(height: 10.h),
                /*Text('Score: ${model.score} / 50',
                    style: Theme.of(context).textTheme.headline4),*/
                Text('Highscore: ${usermodel.highscore} / 50 ',
                    style: Theme.of(context).textTheme.headline4),
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
