import 'package:flutter/material.dart';
import 'package:fluttermaritime/glossarypage.dart';
import 'package:fluttermaritime/materialdesign.dart';
import 'package:fluttermaritime/radiocompage.dart';
import 'package:fluttermaritime/settingspage.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final image = Image.asset('images/homeimage.png');
    var animate = Lottie.network(
        'https://assets5.lottiefiles.com/packages/lf20_gfngwjbu.json');
    var welcomeText = const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Welcome!',
          style: textstyle_h2_black,
        ));
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(235, 239, 245, 1.0),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(children: [
          welcomeText,
          animate,
          box_height20,
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What should we learn today?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          box_height8,
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Glossarypage()));
              },
              child: Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                width: MediaQuery.of(context).size.width * 0.86,
                height: MediaQuery.of(context).size.height * 0.085,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.auto_stories_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                      box_width8,
                      const Text(
                        'Standard Communication',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(),
                      icon_next
                    ]),
              )),
          box_height8,
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Radiocompage()));
              },
              child: Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                width: MediaQuery.of(context).size.width * 0.86,
                height: MediaQuery.of(context).size.height * 0.085,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.cell_tower_rounded,
                        color: Color.fromRGBO(251, 127, 46, 1),
                        size: 40,
                      ),
                      box_width8,
                      Text(
                        'Radio Communication',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      icon_next
                    ]),
              ))
        ]),
      ),
    );
  }
}
