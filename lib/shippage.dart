import 'package:flutter/material.dart';
import 'package:fluttermaritime/radiocompage.dart';

class Shippage extends StatefulWidget {
  const Shippage({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<Shippage> createState() => _ShippageState();
}

class _ShippageState extends State<Shippage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THE SHIP'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Are you sure you want to quit?'),
                    content:
                        const Text('All progress in this section will be lost'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('CANCEL')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Radiocompage()));
                          },
                          child: const Text('YES'))
                    ],
                  )),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
            child: Column(children: [
          const SizedBox(height: 20),
          const Text('Type the matching word',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 20),
          SizedBox(
            child: Image.asset('images/shipexe1.png'),
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: 300,
              child: Row(
                children: [
                  const Expanded(child: Center(child: Text('Fore deck'))),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      validator: (_name) {
                        if (_name != 'a' && _name != 'A') {
                          return 'A';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        _name = text;
                      }),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 10),
          SizedBox(
              width: 300,
              child: Row(
                children: [
                  const Expanded(child: Center(child: Text('After deck'))),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      validator: (_name) {
                        if (_name != 'c' && _name != 'C') {
                          return 'C';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        _name = text;
                      }),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 10),
          SizedBox(
              width: 300,
              child: Row(
                children: [
                  const Expanded(child: Center(child: Text('Accommodation'))),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      validator: (_name) {
                        if (_name != 'b' && _name != 'B') {
                          return 'B';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        _name = text;
                      }),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 120,
          ),
          GestureDetector(
              onTap: _name.isNotEmpty ? _submit : null,
              child: Image.asset('images/checkbutton.png'))
        ])),
      ),
    );
  }
}
