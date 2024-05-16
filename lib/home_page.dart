import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';
import 'home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 1;
  int selectedFactory = 1;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      ProfileScreen(onFactorySelected: (factory) {
        setState(() {
          selectedFactory = factory;
        });
      }),
      HomeScreen(onFactorySelected: (factory) {
        setState(() {
          selectedFactory = factory;
        });
      }),
      SettingsScreen(onFactorySelected: (factory) {
        setState(() {
          selectedFactory = factory;
        });
      }),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Factory $selectedFactory',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              setState(() {
                currentIndex = 2;
              });
            },
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.grey[400],
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: onTabTapped,
        fixedColor: Colors.blue,
      ),
    );
  }
}
