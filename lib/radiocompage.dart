import 'package:flutter/material.dart';
import 'package:fluttermaritime/sentencesradio.dart';
import 'package:fluttermaritime/shippage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Radiocompage extends StatelessWidget {
  const Radiocompage({super.key});

  @override
  Widget build(BuildContext context) {
    var images1 = Image.asset(
      'images/radio_generalphrases.png',
      width: 370.w,
      height: 160.h,
    );
    var images3 = Image.asset(
      'images/radio_theship.png',
      width: 370.w,
      height: 160.h,
    );

    return Scaffold(
      //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
      appBar: AppBar(
        title: const Text('RADIO COMMUNICATION'),
        titleTextStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 30.sp, right: 20.sp, top: 20.sp),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Radiosentences()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      /*padding: EdgeInsets.only(right: 10.sp, left: 10.sp),
                      width: 370.w,
                      height: 274.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]),*/
                      child: Column(children: [
                        images1,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10.w),
                            title: Text(
                              'General Phrases',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            subtitle: Text(
                              'Here is where you can find general phrases for Radio Communication',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        )
                      ]),
                    )),
                SizedBox(height: 10.h),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Shippage(
                                    onSubmit: (String value) {},
                                  )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      // color: Color.fromRGBO(235, 239, 245, 1.0),
                      /* padding: EdgeInsets.only(right: 10.sp, left: 10.sp),
                      width: 370.w,
                      height: 274.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]),*/
                      child: Column(children: [
                        images3,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10.w),
                            title: Text(
                              'The Ship',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            subtitle: Text(
                              'Here is where you can learn about the names of different parts of the ship',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        )
                      ]),
                    )),
              ],
            )),
      ),
    );
  }
}
