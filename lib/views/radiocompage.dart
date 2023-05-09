import 'package:flutter/material.dart';
import 'package:fluttermaritime/Views/sentencesradio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/Views/theshipex.dart';

class Radiocompage extends StatefulWidget {
  const Radiocompage({super.key});

  @override
  State<Radiocompage> createState() => _RadiocompageState();
}

class _RadiocompageState extends State<Radiocompage> {
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
      backgroundColor: const Color.fromRGBO(245, 247, 250, 1.0),
      appBar: AppBar(
        title: const Text('Radio Communication'),
        titleTextStyle: Theme.of(context).textTheme.headline3,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  left: 30.sp, right: 20.sp, top: 20.sp, bottom: 20.sp),
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
                                builder: (context) => ShipExercise()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        elevation: 1,
                        child: Column(children: [
                          images3,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                  left: 15.sp, right: 15.sp, bottom: 10.sp),
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
      ),
    );
  }
}
