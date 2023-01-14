import 'package:flutter/material.dart';
import 'package:route_todoapp/screens/settings_screen.dart';
import 'package:route_todoapp/screens/task_modal_sheet/task_sheet.dart';

import '../screens/tasklist_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fkrny - فكَّرني'),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              context: context,
              builder: (context) {
                return TaskSheet();
              });
        },
        shape: const StadiumBorder(
            side: BorderSide(color: Colors.white, width: 4)),
        child: const Icon(
          Icons.add,
          size: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }

  List<Widget> screens = [TasksScreen(), const SettingsScreen()];
}
