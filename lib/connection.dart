import 'package:countries_ui/bottomnavbar.dart';
import 'package:countries_ui/connecting.dart';
import 'package:countries_ui/countries_screen.dart';
import 'package:countries_ui/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:countries_ui/settings.dart';

class connection extends StatefulWidget {
  const connection({Key? key}) : super(key: key);

  @override
  State<connection> createState() => _connectionState();
}

class _connectionState extends State<connection> {
  int _selectedIndex = 0;
  //String _middleLabel = 'Disconnect';
  late String _middleLabel;
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
  //         MaterialPageRoute(builder: (context) => Countries()), // Replace with your page
  //       );
  //       break;
  //     case 1:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => connecting()), // Replace with your page
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
  //         MaterialPageRoute(builder: (context) => settings()), // Replace with your page
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
  void initState() {
    super.initState();
    _middleLabel = 'Disconnect';
  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomSidebarMenu(onItemSelected: (String) {}),
      ),
      backgroundColor: Color(0xFFF0F2F5),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
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
                      _scaffoldKey.currentState?.openDrawer(); // Open the drawer when image is tapped
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
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Text(
                'Connecting Time',
                style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Text(
                '02:41:52',
                style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: 330,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Image.asset("lib/assets/nl Netherlands.png"),
                  title: Text(
                    "Netherlands",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Amsterdam",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Text(
                          "Stealth",
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "14%",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Container(
                      width: 165,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Image.asset("lib/assets/download.png", height: 28, width: 28),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            "Download:",
                            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "527 MB",
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Container(
                      width: 165,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Image.asset("lib/assets/upload.png", height: 28, width: 28),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            "Upload:",
                            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "49 MB",
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              width: 360,
              child: Image.asset('lib/assets/globe.png', height: 150),
            ),
            Center(
              child: Container(
                height: 56,
                width: 306,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('lib/assets/server.png'),
                    SizedBox(width: 20),
                    Center(
                      child: Text(
                        "Change Server",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Image.asset('lib/assets/arrow-right.png'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Disconnected",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
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
