
import 'package:countries_ui/bottomnavbar.dart';
import 'package:countries_ui/connection.dart';
import 'package:countries_ui/countries_screen.dart';
import 'package:countries_ui/settings.dart';
import 'package:countries_ui/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class connecting extends StatefulWidget {
  const connecting({Key? key}) : super(key: key);

  @override
  State<connecting> createState() => _connectingState();
}

class _connectingState extends State<connecting> {
  int _selectedIndex = 0;
  String _middleLabel = 'Disconnect';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // void _onNavBarItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //
  //   switch (index) {
  //     case 0:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => Countries()),
  //       );
  //       break;
  //     case 1:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => connecting()),
  //       );
  //       break;
  //     case 2:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => connection()), // Replace with your page
  //       );
  //       break;
  //     case 3:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => settings()),
  //       );
  //       break;
  //   }
  // }
  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Countries()),
        );
        break;
      case 1:
        if (_middleLabel == 'Disconnect') {
          setState(() {
            _middleLabel = 'Connecting';
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => connecting()),
          );
        } else if (_middleLabel == 'Connecting') {
          setState(() {
            _middleLabel = 'Connected';
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => connection()), // Make sure this screen exists
          );
        } else if (_middleLabel == 'Connected') {
          setState(() {
            _middleLabel = 'Disconnect';
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Countries()),
          );
        }
        break;
      case 2:
        setState(() {
          _middleLabel = 'Disconnect';
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => settings()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Attach the key to Scaffold
      drawer: Drawer(
        child: CustomSidebarMenu(onItemSelected: (String ) {  },),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.20),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Image.asset(
                        "lib/assets/appbar.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Pearl Vpn',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.20),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "lib/assets/crown.png",
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Status',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Connecting...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                child: Image.asset('lib/assets/nl Netherlands.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Netherlands',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Amsterdam',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 40),
              Container(
                height: 280,
                width: 360,
                child: Image.asset('lib/assets/connectingglobe.png', height: 150),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => connection()),
                  );
                },
                child: Container(
                  height: 56,
                  width: 306,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.30),
                  ),
                  child: Center(
                    child: Text(
                      "Cancel Connection",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onNavBarItemTapped,
        middleLabel: _middleLabel,

      ),
    );
  }
}
