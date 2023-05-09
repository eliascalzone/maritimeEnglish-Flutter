import 'package:flutter/material.dart';
import 'package:fluttermaritime/model.dart';

class RootPage extends StatelessWidget {
  final Model model;
  final void Function(int) changePage;

  const RootPage({required this.model, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: model.pages[model.currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: model.currentPage,
        selectedItemColor: Color.fromRGBO(76, 146, 219, 1),
        onTap: (int index) {
          changePage(index);
        },
      ),
    );
  }
}