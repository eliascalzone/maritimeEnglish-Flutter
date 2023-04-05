import 'package:flutter/material.dart';
import 'package:fluttermaritime/main.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Celebrate extends StatelessWidget {
  const Celebrate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WELL DONE!',
            style: Theme.of(context).textTheme.headline4,
          ),
          Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_touohxv0.json',
              height: 270.h),
          SizedBox(
            height: 50.h,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(270.w, 50.h)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)))),
              child: Text(
                'BACK TO HOME',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ));
  }
}
