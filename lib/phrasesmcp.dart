import 'package:flutter/material.dart';

class Phrasesmcp extends StatefulWidget {
  const Phrasesmcp({Key? key}) : super(key: key);

  @override
  State<Phrasesmcp> createState() => _PhrasesmcpState();
}

class _PhrasesmcpState extends State<Phrasesmcp> {
  final List<Map<String, dynamic>> _allwords = [
    {
      'name': 'Abandon vessel',
      'mean':
          'To evacuate crew and passengers from a vessel following a distress'
    },
    {
      'name': 'Accommodation ladder',
      'mean':
          'Ladder attached to platform at vessels side with flat steps and handrailsenabling persons to embark / disembark from water or shore'
    },
    {
      'name': 'Adrift',
      'mean':
          'Uncontrolled movement at sea under the influence of current, tide or wind'
    },
    {
      'name': 'Air draft',
      'mean': 'The height from the waterline to the highest point of the vessel'
    },
    {
      'name': 'Assembly station',
      'mean':
          'Place on deck, in mess rooms, etc., assigned to crew and passengers where they have to meet according to the muster list when the corresponding alarm is released or announcement made'
    },
    {
      'name': 'Backing (of wind) ',
      'mean':
          'Shift of wind direction in an anticlockwise manner, for example from north to west (opposite of veering)'
    },
    {
      'name': 'Beach (to)',
      'mean':
          'To run a vessel up on a beach to prevent its sinking in deep water'
    },
    {
      'name': 'Berth',
      'mean':
          'A sea room to be kept for safety around a vessel, rock, platform, etc.'
    },
    {'name': 'Blast', 'mean': 'A whistle signal made by the vessel'},
    {
      'name': 'Blind sector',
      'mean':
          'An area which cannot be scanned by the ship’s radar because it is shielded by parts of the superstructure, masts, etc'
    },
    {
      'name': 'Boarding arrangements ',
      'mean':
          'All equipment, such as pilot ladder, accommodation ladder, hoist, etc., necessary for a safe transfer of the pilot'
    },
    {
      'name': 'Bob-cat',
      'mean':
          'A mini-caterpillar with push-blade used for the careful distribution of loose goods in cargo holds of bulk carriers'
    },
    {
      'name': 'Briefing',
      'mean': 'Concise explanatory information to crew and/or passengers'
    }
  ];
  List<Map<String, dynamic>> _foundwords = [];
  @override
  void initState() {
    super.initState();
    _foundwords = _allwords;
  }

  void _filter(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = _allwords;
    } else {
      results = _allwords
          .where((element) =>
              element['name'].toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundwords = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GENERAL TERMS')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          TextField(
            onChanged: (value) => _filter(value),
            decoration: InputDecoration(
              hintText: 'Search phrase list starting with ... ',
              labelStyle: const TextStyle(color: Colors.blue),
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Expanded(
              child: _foundwords.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundwords.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          key: ValueKey(_foundwords[index]),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              _foundwords[index]['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1),
                            ),
                            subtitle: Text(
                              _foundwords[index]['mean'],
                              style: const TextStyle(
                                  fontSize: 16, letterSpacing: 1),
                            ),
                          ),
                        );
                      })
                  : const Center(child: Text('Nothing Found')))
        ]),
      ),
    );
  }
}
