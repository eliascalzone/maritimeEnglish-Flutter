import 'package:flutter/material.dart';
import 'package:fluttermaritime/celebrate1.dart';
import 'package:fluttermaritime/theshipdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttermaritime/radiocompage.dart';

class ShipExercise extends StatefulWidget {
  const ShipExercise({Key? key}) : super(key: key);
  //final ValueChanged<List<Map<String, List<ShipPart>>>> restart;

  @override
  State<ShipExercise> createState() => _ShipExerciseState();
}

class _ShipExerciseState extends State<ShipExercise> {
  final List<Map<String, List<ShipPart>>> shiplist = List.from(shipList);
  final FlutterTts flutterTts = FlutterTts();
  List<ShipPart> shuffledShipParts = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Shuffle the list of draggable items once when the state is initialized
    shuffledShipParts = shiplist[currentIndex].values.first.toList()..shuffle();
  }

  void goNextShip() {
    setState(() {
      currentIndex++;
      if (currentIndex == shiplist.length) {
        currentIndex = 0;
        /*Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Celebrate1()),
            (route) => route.isFirst);*/
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Celebrate1()),
        );
        print('Restarting game...');
        print('Before restart: currentIndex=$currentIndex, shiplist=$shiplist');

        restartGame();
        print('After restart: currentIndex=$currentIndex, shiplist=$shiplist');
      }

      shuffledShipParts = shiplist[currentIndex].values.first.toList()
        ..shuffle();
    });
  }

  void restartGame() {
    setState(() {
      shiplist.clear();
      print('Clear shiplist: currentIndex=$currentIndex, shiplist=$shiplist');
      /*shiplist[currentIndex]
          .values
          .first
          .addAll(shiplist[currentIndex].values.first);*/

      //shiplist.addAll([...shipList]);
      final List<Map<String, List<ShipPart>>> copyShiplist =
          List.from(shipList);
      shiplist.addAll(copyShiplist);

      print('Add all shiplist: currentIndex=$currentIndex, shiplist=$shiplist');
      currentIndex = 0;
      shuffledShipParts = shiplist[currentIndex].values.first.toList()
        ..shuffle();
      print('Game restarted.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THE SHIP',
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
          icon: Icon(
            Icons.close,
            size: 24.spMin,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.sp,
            bottom: 20.sp,
          ),
          child: Column(
            children: [
              ListTile(
                  contentPadding: EdgeInsets.only(left: 30.sp),
                  title: Text(
                    'Drag the matching pairs',
                    style: Theme.of(context).textTheme.headline2,
                  )),
              Container(
                color: Colors.white,
                height: 300.h,
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.sp, right: 20.sp, top: 20.sp, bottom: 20.sp),
                    child: Image.asset(shiplist[currentIndex].keys.first)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                      //(shiplist[currentIndex].values.first.toList()..shuffle())
                      shuffledShipParts
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
                                    onDragStarted: () async {
                                      await flutterTts.setLanguage("en-US");
                                      await flutterTts.setSpeechRate(0.5);
                                      await flutterTts.setVolume(1.0);
                                      await flutterTts.setPitch(1);
                                      await flutterTts.speak(shipname.shipPart);
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
                  children: shiplist[currentIndex]
                      .values
                      .first
                      .map((shipname) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.sp),
                            child: DragTarget<ShipPart>(
                                onAccept: (receivedItem) {
                                  setState(() {
                                    if (shipname.shipPart ==
                                        receivedItem.shipPart) {
                                      setState(() {
                                        shuffledShipParts.remove(receivedItem);
                                        shiplist[currentIndex]
                                            .values
                                            .first
                                            .remove(receivedItem);
                                      });
                                    }
                                  });
                                },
                                onWillAccept: (receivedItem) => true,
                                builder: (context, acceptData, rejectedData) =>
                                    Container(
                                        child: Card(
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
                                                ))))),
                          ))
                      .toList(),
                ),
              ]),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                onPressed: () {
                  goNextShip();
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
