import 'package:flutter/material.dart';
import 'package:sellon/constant.dart';
import 'package:sellon/screen/home.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _children = <Widget>[
    HomePage(),
    Text("Hallo 2"),
    Text("Hallo 3"),
    Text("Hallo 4"),
    Text("Hallo 5"),
  ];

  void onTabPress(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       onTabPress(2);
      //     });
      //   },
      //   tooltip: 'Sell',
      //   child: new Icon(Icons.store),
      //   elevation: 4.0,
      // ),
      bottomNavigationBar: ButtonNav(currentIndex: _currentIndex, onTabPress: onTabPress,),
      body: SafeArea(
          child: Container(
       child: _children[_currentIndex], 
      )),
    );
  }
}


class ButtonNav extends StatefulWidget {
  final int currentIndex;
  final void Function(int) onTabPress;

  const ButtonNav({
    super.key, 
    required this.currentIndex, required this.onTabPress, 
    });


  @override
  State<ButtonNav> createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {

   final List<Map<String, Object>> _tabs = <Map<String, Object>>[
    {
      'icon': Icon(Icons.home),
      'label': 'Home',
      // 'body': TabHome(),
    },
    {
      'icon': Icon(Icons.chat_bubble),
      'label': 'Chat',
      // 'body': TabBusiness(),
    },
    {
      'icon': Icon(Icons.people),
      'label': 'Feed',
      // 'body': TabSchool(),
    },
    {
      'icon': Icon(Icons.person_outline),
      'label': 'Profile',
      // 'body': TabSchool(),
    },
  ];
  
  @override

  Widget build(BuildContext context) {
    return BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontSize: 13
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 13
          ),
          onTap: widget.onTabPress,
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_rounded), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Sell'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ]);
  }

  
}
