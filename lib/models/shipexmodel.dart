class ShipPart {
  final String shipPart;
  final String id;

  ShipPart(this.shipPart, this.id);
}

class ShipExModel {
  int _progress = 0;

  int get progress => _progress;

  void incrementProgress() {
    _progress++;
  }

  int _highscore = 0;

  int get highscore => _highscore;

  void setHighscore(int newScore){
    _highscore = newScore;
  }

  int _score = 0;

  int get score => _score;

  void increaseScore() {
    _score++;
  }

  void decreaseScore() {
    _score--;
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void incrementIndex() {
    _currentIndex++;
  }

  List<List<ShipPart>> _shiplist = [];

  List<List<ShipPart>> get shiplist => _shiplist;

  List<ShipPart> _shuffledShipParts = [];

  List<ShipPart> get shuffledShipParts => _shuffledShipParts;

  List<String> pictures = [
    'images/pic1.png',
    'images/pic2.png',
    'images/pic3.png',
    'images/pic4.png',
    'images/pic5.png',
    'images/pic6.png',
    'images/pic7.png',
    'images/pic8.png',
    'images/pic9.png',
    'images/pic10.png',
    'images/pic11.png'
  ];

  List<ShipPart> list1 = [];
  List<ShipPart> list2 = [];
  List<ShipPart> list3 = [];
  List<ShipPart> list4 = [];
  List<ShipPart> list5 = [];
  List<ShipPart> list6 = [];
  List<ShipPart> list7 = [];
  List<ShipPart> list8 = [];
  List<ShipPart> list9 = [];
  List<ShipPart> list10 = [];
  List<ShipPart> list11 = [];

  void resetLists() {
    list1 = [
      ShipPart('radar scanner', '1'),
      ShipPart('radio antenna', '2'),
      ShipPart('the navigation bridge', '3'),
      ShipPart('rescue boat', '4'),
      ShipPart('the superstructure', '5'),
    ];
    list2 = [
      ShipPart('crane', '6'),
      ShipPart('mooring winch', '7'),
      ShipPart('the hull', '8'),
      ShipPart('the windlass', '9'),
      ShipPart('hatch cover', '10'),
    ];
    list3 = [
      ShipPart('the poop deck', '11'),
      ShipPart('funnels', '12'),
      ShipPart('the main deck', '13'),
      ShipPart('tween deck', '14'),
    ];
    list4 = [
      ShipPart('hold', '15'),
      ShipPart('bottom', '16'),
      ShipPart('bulkhead', '17'),
      ShipPart('engine room', '18'),
      ShipPart('ladder', '19'),
    ];

    list5 = [
      ShipPart('forward', '1'),
      ShipPart('aft', '2'),
      ShipPart('breadth', '3'),
      ShipPart('abeam', '4'),
      ShipPart('midships', '5'),
    ];
    list6 = [
      ShipPart('centre line', '6'),
      ShipPart('starboard bow', '7'),
      ShipPart('STARBOARD', '8'),
      ShipPart('starboard quarter', '9'),
    ];
    list7 = [
      ShipPart('port quater', '10'),
      ShipPart('PORT', '11'),
      ShipPart('port bow', '12'),
      ShipPart('ahead', '13'),
      ShipPart('astern', '14'),
    ];
    list8 = [
      ShipPart('stern line', '15'),
      ShipPart('aft breast line', '16'),
      ShipPart('bow', '17'),
      ShipPart('ahead', '18'),
      ShipPart('forecastle', '19'),
    ];

    list9 = [
      ShipPart('under-keel\nclearance', '1'),
      ShipPart('freeboard', '2'),
      ShipPart('air draft', '3'),
      ShipPart('draft', '4'),
    ];

    list10 = [
      ShipPart('forward spring', '5'),
      ShipPart('breast line', '6'),
      ShipPart('head line', '7'),
      ShipPart('buoy line', '8'),
    ];
    list11 = [
      ShipPart('fairlead', '9'),
      ShipPart('centre lead', '10'),
      ShipPart('roller fairlead', '11'),
      ShipPart('capstan', '12'),
    ];
  }

  void initGame() {
    _progress = 0;
    _score = 0;
    resetLists();
    _shiplist.clear();
    _shiplist = [
      list1,
      list2,
      list3,
      list4,
      list5,
      list6,
      list7,
      list8,
      list9,
      list10,
      list11
    ];
    _currentIndex = 0;
    _shuffledShipParts.clear();
    shuffleWithCurrentIndex();
  }

  void shuffleWithCurrentIndex() {
    _shuffledShipParts = _shiplist[currentIndex].toList()..shuffle();
  }

  void onAccept(ShipPart dragged, ShipPart target) {
    if (target.shipPart == dragged.shipPart) {
      _shuffledShipParts.remove(dragged);
      _shiplist[currentIndex].remove(dragged);
      increaseScore();
    } else {
      decreaseScore();
    }
  }
}