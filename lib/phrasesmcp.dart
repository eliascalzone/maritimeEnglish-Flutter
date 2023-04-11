import 'package:flutter/material.dart';
import 'allwordslist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Phrasesmcp extends StatefulWidget {
  const Phrasesmcp({Key? key}) : super(key: key);

  @override
  State<Phrasesmcp> createState() => _PhrasesmcpState();
}

class _PhrasesmcpState extends State<Phrasesmcp> {
  final List<Map<String, dynamic>> _allwords = List.from(allwords);
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
      //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
      appBar: AppBar(
        title: const Text('GENERAL TERMS'),
        titleTextStyle: Theme.of(context).textTheme.headline3,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: 20.sp, left: 30.sp, right: 30.sp, bottom: 20.sp),
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
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
            Expanded(
                child: _foundwords.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundwords.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            key: ValueKey(_foundwords[index]),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 1,
                            child: ListTile(
                              title: Text(
                                _foundwords[index]['name'],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              subtitle: Text(
                                _foundwords[index]['mean'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          );
                        })
                    : const Center(child: Text('Nothing Found')))
          ]),
        ),
      ),
    );
  }
}
