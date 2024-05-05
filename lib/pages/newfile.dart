import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todowebapp/pages/homepage.dart';
import 'package:todowebapp/pages/missingcashback.dart';
import 'package:todowebapp/pages/myearnings.dart';
import 'package:todowebapp/pages/profile.dart';

class BottomNavigationDemo extends StatefulWidget {
  final GoogleSignInAccount user;
  BottomNavigationDemo({required this.user});
  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      FoodAppHome(),
      MyEarnings(),
      MissingCashback(),
      Profile(user: widget.user),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'My Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off_csred),
            label: 'missing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'First Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Second Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Third Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Fourth Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
