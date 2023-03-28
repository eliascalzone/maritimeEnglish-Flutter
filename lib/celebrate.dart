import 'package:flutter/material.dart';
import 'package:fluttermaritime/homepage.dart';
import 'package:fluttermaritime/main.dart';
import 'package:fluttermaritime/radiocompage.dart';

class Celebrate extends StatelessWidget {
  const Celebrate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/celebrate.png'),
        const SizedBox(
          height: 80,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(
                  MediaQuery.of(context).size.width * 0.6,
                  MediaQuery.of(context).size.height * 0.05,
                )),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            child: const Text(
              'BACK TO HOME',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
      ],
    ));
  }
}
