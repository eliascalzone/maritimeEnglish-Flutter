import 'package:flutter/material.dart';
import 'package:fluttermaritime/celebrate.dart';
import 'package:fluttermaritime/radiocompage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Shippage1 extends StatefulWidget {
  const Shippage1({super.key});

  @override
  State<Shippage1> createState() => _Shippage1State();
}

class _Shippage1State extends State<Shippage1> {
  AudioCache audioCache = AudioCache();

  //Method variable
  String _name12 = 'a';
  String _name22 = 'c';
  String _name32 = 'd';
  String _name42 = 'b';
  String message2 = '';
  TextEditingController controller12 = TextEditingController();
  TextEditingController controller22 = TextEditingController();
  TextEditingController controller32 = TextEditingController();
  TextEditingController controller42 = TextEditingController();

  bool checkanswer1() {
    return controller12.text.toLowerCase() == _name12.toLowerCase();
  }

  bool checkanswer2() {
    return controller22.text.toLowerCase() == _name22.toLowerCase();
  }

  bool checkanswer3() {
    return controller32.text.toLowerCase() == _name32.toLowerCase();
  }

  bool checkanswer4() {
    return controller42.text.toLowerCase() == _name42.toLowerCase();
  }

  void _submit2() {
    List<String> incorrectAnswers2 = [];
    if (!checkanswer1()) {
      incorrectAnswers2.add('Superstructure - A');
    }
    if (!checkanswer2()) {
      incorrectAnswers2.add('Anchor - C');
    }
    if (!checkanswer3()) {
      incorrectAnswers2.add('Bow - D');
    }
    if (!checkanswer4()) {
      incorrectAnswers2.add('Portside - B');
    }
    if (incorrectAnswers2.isEmpty) {
      message2 = 'Amazing!!';
      audioCache.play('correct.wav');
    } else {
      message2 = 'Incorrect: \n' + '\n' + incorrectAnswers2.join('\n');
      audioCache.play('incorrect.mp3');
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (message2 == 'Amazing!!') {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Celebrate()),
            );
          });
          return AlertDialog(
              alignment: Alignment.bottomCenter,
              actionsAlignment: MainAxisAlignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 100.h,
                child: Text(message2),
              )

              /* alignment: Alignment.bottomCenter,
              actionsAlignment: MainAxisAlignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              content: Text(message2)*/
              );
        } else {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
            actionsAlignment: MainAxisAlignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            content: Text(message2),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const Celebrate()),
                        ));
                  }
                },
                child: Text(
                  'GOT IT',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(251, 127, 46, 1.0)),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('THE SHIP'),
          titleTextStyle: Theme.of(context).textTheme.headline3,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      title: Text(
                        'Are you sure you want to quit?',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      content: Text(
                        'All progress in this section will be lost',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Radiocompage()),
                                  (route) => route.isFirst);
                            },
                            child: Text(
                              'YES',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                            ))
                      ],
                    )),
            icon: Icon(Icons.close),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.sp),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                        contentPadding: EdgeInsets.only(left: 30.sp),
                        title: Text(
                          'Type the matching word',
                          style: Theme.of(context).textTheme.headline2,
                        )),
                    Image.asset(
                      'images/shipnextexe.png',
                      width: 370.w,
                      height: 277.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(children: [
                      SizedBox(
                          width: 300.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                'Superstructure',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                              SizedBox(
                                width: 150.w,
                                child: TextFormField(
                                  controller: controller12,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(4.sp),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      )),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                          width: 300.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                'Anchor',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                              SizedBox(
                                width: 150.w,
                                child: TextFormField(
                                  controller: controller22,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(4.sp),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      )),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                          width: 300.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                'Bow',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                              SizedBox(
                                width: 150.w,
                                child: TextFormField(
                                  controller: controller32,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(4.sp),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      )),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                          width: 300.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                'Portside',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                              SizedBox(
                                width: 150.w,
                                child: TextFormField(
                                  controller: controller42,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(4.sp),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      )),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ))
                    ]),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _submit2();
                      },
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(280.w, 50.h)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r)))),
                      child: Text(
                        'CHECK',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}
