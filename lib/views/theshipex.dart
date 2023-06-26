import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttermaritime/models/shipexmodel.dart';

class ShipExercise extends StatelessWidget {
  final ShipExModel model;
  final void Function(BuildContext) goBack;
  final void Function(ShipPart, ShipPart) onAccept;
  final void Function(BuildContext) nextShip;
  final void Function(String) speakTts;

  const ShipExercise({super.key, required this.model, required this.goBack, required this.onAccept, required this.nextShip, required this.speakTts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Match the words with the numbers',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                            goBack(context);
                          },
                          child: Text(
                            'YES',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ))
                    ],
                  )),
          icon: Icon(
            Icons.close,
            size: 24.spMin,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.sp,
            bottom: 20.sp,
          ),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 300.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(207, 207, 207, 1),
                      color: Color.fromRGBO(75, 219, 78, 1),
                      value: model.progress / 11,
                      minHeight: 15.h,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Row(children: [
                  Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    '${11 - model.progress}',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  )
                ]),
              ]),
              SizedBox(
                height: 12.h,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Score: ",
                    style: Theme.of(context).textTheme.headline2),
                TextSpan(
                    text: "${model.score} / 50",
                    style: TextStyle(
                        color: Color.fromRGBO(75, 219, 78, 1),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold))
              ])),
              SizedBox(
                height: 12.h,
              ),
              Container(
                color: Colors.white,
                height: 300.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.sp, right: 20.sp, top: 20.sp, bottom: 20.sp),
                  child: Image.asset(
                    model.pictures[model.currentIndex],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                      model.shuffledShipParts
                          .map((shipname) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.sp),
                                child: Draggable<ShipPart>(
                                    data: shipname,
                                    feedback: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        elevation: 4,
                                        child: Padding(
                                            padding: EdgeInsets.all(5.sp),
                                            child: Center(
                                              child: Text(
                                                shipname.shipPart,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ))),
                                    childWhenDragging: Container(),
                                    onDragStarted: () {
                                      speakTts(shipname.shipPart);
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        elevation: 4,
                                        child: Padding(
                                            padding: EdgeInsets.all(10.sp),
                                            child: Center(
                                              child: Text(
                                                shipname.shipPart,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            )))),
                              ))
                          .toList(),
                ),
                Column(
                  children: model.shiplist[model.currentIndex]
                      .map((shipname) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.sp),
                            child: DragTarget<ShipPart>(
                                onAccept: (receivedItem) {
                                  onAccept(receivedItem, shipname);
                                },
                                onWillAccept: (receivedItem) => true,
                                builder: (context, acceptData, rejectedData) =>
                                    Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    10.r)),
                                        elevation: 4,
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                30.sp, 10.sp, 30.sp, 10.sp),
                                            child: Center(
                                              child: Text(
                                                shipname.id,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            )))),
                          ))
                      .toList(),
                ),
              ]),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                onPressed: () {
                  nextShip(context);
                },
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(280.w, 50.h)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)))),
                child: Text(
                  'CONTINUE',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
