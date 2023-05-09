class ShipPart {
  final String shipPart;
  final String id;

  ShipPart(this.shipPart, this.id);
}

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

List<Map<String, List<ShipPart>>> shipList = [
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
