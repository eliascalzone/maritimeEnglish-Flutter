import 'package:flutter/material.dart';
import 'package:fluttermaritime/celebrate.dart';
import 'package:fluttermaritime/theshipdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttermaritime/radiocompage.dart';

class ShipExercise extends StatefulWidget {
  const ShipExercise({Key? key}) : super(key: key);

  @override
  State<ShipExercise> createState() => _ShipExerciseState();
}

class _ShipExerciseState extends State<ShipExercise> {
  int score = 0;
  List<Map<String, List<ShipPart>>> shiplist = [];
  List<ShipPart> list1 = [
    ShipPart('radar scanner', '1'),
    ShipPart('radio antenna', '2'),
    ShipPart('the navigation bridge', '3'),
    ShipPart('rescue boat', '4'),
    ShipPart('the superstructure', '5'),
  ];
  List<ShipPart> list2 = [
    ShipPart('crane', '6'),
    ShipPart('mooring winch', '7'),
    ShipPart('the hull', '8'),
    ShipPart('the windlass', '9'),
    ShipPart('hatch cover', '10'),
  ];
  List<ShipPart> list3 = [
    ShipPart('the poop deck', '11'),
    ShipPart('funnels', '12'),
    ShipPart('the main deck', '13'),
    ShipPart('tween deck', '14'),
  ];
  List<ShipPart> list4 = [
    ShipPart('hold', '15'),
    ShipPart('bottom', '16'),
    ShipPart('bulkhead', '17'),
    ShipPart('engine room', '18'),
    ShipPart('ladder', '19'),
  ];

  List<ShipPart> list5 = [
    ShipPart('forward', '1'),
    ShipPart('aft', '2'),
    ShipPart('breadth', '3'),
    ShipPart('abeam', '4'),
    ShipPart('midships', '5'),
  ];
  List<ShipPart> list6 = [
    ShipPart('centre line', '6'),
    ShipPart('starboard bow', '7'),
    ShipPart('STARBOARD', '8'),
    ShipPart('starboard quarter', '9'),
  ];
  List<ShipPart> list7 = [
    ShipPart('port quater', '10'),
    ShipPart('PORT', '11'),
    ShipPart('port bow', '12'),
    ShipPart('ahead', '13'),
    ShipPart('astern', '14'),
  ];
  List<ShipPart> list8 = [
    ShipPart('stern line', '15'),
    ShipPart('aft breast line', '16'),
    ShipPart('bow', '17'),
    ShipPart('ahead', '18'),
    ShipPart('forecastle', '19'),
  ];

  List<ShipPart> list9 = [
    ShipPart('under-keel\nclearance', '1'),
    ShipPart('freeboard', '2'),
    ShipPart('air draft', '3'),
    ShipPart('draft', '4'),
  ];

  List<ShipPart> list10 = [
    ShipPart('forward spring', '5'),
    ShipPart('breast line', '6'),
    ShipPart('head line', '7'),
    ShipPart('buoy line', '8'),
  ];
  List<ShipPart> list11 = [
    ShipPart('fairlead', '9'),
    ShipPart('centre lead', '10'),
    ShipPart('roller fairlead', '11'),
    ShipPart('capstan', '12'),
  ];

  final FlutterTts flutterTts = FlutterTts();
  List<ShipPart> shuffledShipParts = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    score = 0;
    shiplist = [
      {'images/pic1.png': list1},
      {'images/pic2.png': list2},
      {'images/pic3.png': list3},
      {'images/pic4.png': list4},
      {'images/pic5.png': list5},
      {'images/pic6.png': list6},
      {'images/pic7.png': list7},
      {'images/pic8.png': list8},
      {'images/pic9.png': list9},
      {'images/pic10.png': list10},
      {'images/pic11.png': list11},
    ];
    // Shuffle the list of draggable items once when the state is initialized
    shuffledShipParts = shiplist[currentIndex].values.first.toList()..shuffle();
  }

  void goNextShip() {
    setState(() {
      currentIndex++;
      if (currentIndex == shiplist.length) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Celebrate()),
            ((route) => route.isFirst));
        restartGame();
        setState(() {});
      } else {
        shuffledShipParts = shiplist[currentIndex].values.first.toList()
          ..shuffle();
      }
    });
  }

  void restartGame() {
    setState(() {
      shiplist.clear();
      shiplist.addAll(List.from(shipList));
      currentIndex = 0;
      shuffledShipParts = shiplist[currentIndex].values.first.toList()
        ..shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Ship',
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
      backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.sp,
            bottom: 20.sp,
          ),
          child: Column(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Score: ",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "$score" + " / 50",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold))
              ])),
              ListTile(
                  contentPadding: EdgeInsets.only(left: 30.sp),
                  title: Text(
                    'Match the words with the numbers',
                    style: Theme.of(context).textTheme.headline2,
                  )),
              Container(
                color: Colors.white,
                height: 300.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.sp, right: 20.sp, top: 20.sp, bottom: 20.sp),
                  child: Image.asset(
                    shiplist[currentIndex].keys.first,
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
                                        score += 1;
                                      });
                                    } else {
                                      setState(() {
                                        score -= 1;
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
