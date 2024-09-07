import 'package:countries_ui/bottomnavbar.dart';
import 'package:countries_ui/connecting.dart';
import 'package:countries_ui/connection.dart';
import 'package:countries_ui/countries_screen.dart';
import 'package:countries_ui/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
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

  bool vpnAccelerator = true;
  bool vpnAcceleratorNotifications = true;
  bool splitTunneling = false;
  bool netShield = true;
  bool killSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomSidebarMenu(onItemSelected: (String) {}),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
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
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                    child: Text(
                      'Quick Connect',
                      style:GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Fastest',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SwitchListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                    child: Text(
                      'VPN Accelerator',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'VPN Accelerator Enables A Set Unique Performance Enhancement Technologies Which Can Increase VPN Speeds Up To 400%',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: vpnAccelerator,
                  activeColor: Color(0xFF185BFF),
                  onChanged: (value) {
                    setState(() {
                      vpnAccelerator = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                    child: Text(
                      'VPN Accelerator notifications',
                      style:GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Get Notified When VPN Accelerator Switches You To A Faster Server',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: vpnAcceleratorNotifications,
                  activeColor: Color(0xFF185BFF),
                  onChanged: (value) {
                    setState(() {
                      vpnAcceleratorNotifications = value;
                    });
                  },
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                    child: Text(
                      'Split Tunneling',
                      style:GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Allows Certain Apps Or IPs To Be Excluded From The VPN Traffic',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SwitchListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                    child: Text(
                      'NetShield',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Block Advertisements, Trackers And Malware',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: netShield,
                  activeColor: Color(0xFF185BFF),
                  onChanged: (value) {
                    setState(() {
                      netShield = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                    child: Text(
                      'Kill Switch',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Block All VPN Traffic If Your VPN Connection Is Disrupted',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: killSwitch,
                  activeColor: Color(0xFF185BFF),
                  onChanged: (value) {
                    setState(() {
                      killSwitch = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onNavBarItemTapped,
        middleLabel: _middleLabel,

      ),
    );
  }
}
