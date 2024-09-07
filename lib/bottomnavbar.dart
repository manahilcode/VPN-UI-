// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onItemTapped;
//
//   BottomNavBar({
//     required this.currentIndex,
//     required this.onItemTapped,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Image.asset('lib/assets/map.png'),
//           label: 'Countries',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset('lib/assets/radar.png'),
//           label: 'Connecting',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset('lib/assets/setting.png'),
//           label: 'Settings',
//         ),
//       ],
//       currentIndex: currentIndex,
//       selectedItemColor:Color(0xFF185BFF),
//       unselectedItemColor: Colors.grey,
//       onTap: onItemTapped,
//     );
//   }
// }
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final String middleLabel;

  BottomNavBar({
    required this.currentIndex,
    required this.onItemTapped,
    required this.middleLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('lib/assets/map.png'),
          label: 'Countries',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('lib/assets/radar.png'),
          label: middleLabel,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('lib/assets/setting.png'),
          label: 'Settings',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFF185BFF),
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }
}