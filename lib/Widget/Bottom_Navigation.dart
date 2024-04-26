import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../Guzo/guzo_home.dart';


class AppBarWithBottomNav extends StatefulWidget {
  final int initialIndex;

  const AppBarWithBottomNav({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<AppBarWithBottomNav> createState() => _AppBarWithBottomNavState();
}

class _AppBarWithBottomNavState extends State<AppBarWithBottomNav> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlay style for this widget
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF1E1C67), // Color for the status bar background
        statusBarIconBrightness: Brightness.light, // Brightness of the status bar icons
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          GuzoGoHome(title: ''), // Instantiate GuzoGoHome widget

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Set type to fixed
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFF1E1C67),
        onTap: (int index) {
          _onIndexChanged(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_sharp),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
