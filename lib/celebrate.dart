import 'package:flutter/material.dart';
import 'package:fluttermaritime/main.dart';
import 'package:fluttermaritime/theshipex.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Celebrate extends StatelessWidget {
  const Celebrate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELL DONE!',
              style: Theme.of(context).textTheme.headline4,
            ),
            Lottie.asset('assets/welldone.json', height: 270.h),
            SizedBox(
              height: 50.h,
            ),
            /*ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShipExercise()),
                  );
                },
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(280.w, 50.h)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)))),
                child: Text(
                  'CONTINUE',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )),*/
          ],
        ),
      ),
    ));
  }
}
