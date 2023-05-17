import 'package:flutter/material.dart';
import 'package:fluttermaritime/controllers/settingsController.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model.dart';

class Homepage extends StatelessWidget {
  final Model model;
  final void Function(BuildContext) goToStandardCom;
  final void Function(BuildContext) goToRadioCom;
  final void Function(int) changeScreen;

  const Homepage({super.key, required this.model, required this.goToStandardCom, required this.goToRadioCom, required this.changeScreen});

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
        body: model.currentScreen == 1 ? SettingsController(model: model) :
        SingleChildScrollView(
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
                          goToStandardCom(context);
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
                          goToRadioCom(context);
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
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: model.currentScreen,
        selectedItemColor: Color.fromRGBO(76, 146, 219, 1),
        onTap: (int index) {
          changeScreen(index);
        },
      ),
        );
  }
}
