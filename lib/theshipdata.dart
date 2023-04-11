class ShipPart {
  final String shipPart;
  final String id;

  ShipPart(this.shipPart, this.id);
}

List<ShipPart> list2 = [
  ShipPart('the navigation bridge', '1'),
  ShipPart('radar scanner', '2'),
  ShipPart('rescue boat', '3'),
  ShipPart('radio antenna', '4'),
  ShipPart('hatch cover', '5'),
];
List<ShipPart> list3 = [
  ShipPart('crane', '6'),
  ShipPart('the forecastle', '7'),
  ShipPart('mooring winch', '8'),
  ShipPart('the hull', '9'),
  ShipPart('the windlass', '10'),
];
List<ShipPart> list4 = [
  ShipPart('ladder', '11'),
  ShipPart('rescue boat', '12'),
  ShipPart('the forecastle', '13'),
  ShipPart('the stern', '14'),
  ShipPart('the windlass', '15'),
];
List<ShipPart> list5 = [
  ShipPart('under-keel\nclearance', '1'),
  ShipPart('freeboard', '2'),
  ShipPart('air draft', '3'),
  ShipPart('draft', '4'),
];

List<ShipPart> list6 = [
  ShipPart('forward spring', '5'),
  ShipPart('breast line', '6'),
  ShipPart('head line', '7'),
  ShipPart('buoy line', '8'),
];
List<ShipPart> list7 = [
  ShipPart('fairlead', '9'),
  ShipPart('centre lead', '10'),
  ShipPart('roller fairlead', '11'),
  ShipPart('capstan', '12'),
];

List<Map<String, List<ShipPart>>> shipList = [
  // {'images/ship2.png': list2},
  {'images/ship2_1.png': list2},
  //{'images/ship3.png': list3},
  {'images/ship3_1.png': list3},
  //{'images/ship6.png': list4},
  {'images/ship5.png': list5},
  {'images/ship6.png': list6},
  {'images/ship7.png': list7},
];
