import 'package:countries_ui/connection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'connecting.dart';
import 'sidebar.dart';
import 'bottomnavbar.dart';
import 'settings.dart';

class Countries extends StatefulWidget {
  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  int _selectedIndex = 0;

  String _middleLabel = 'Disconnect';
  final List<Country> freeCountries = [
    Country(
      imagePath: "lib/assets/it Italy.png",
      name: "Italy",
      locationCount: "4 locations",
      buttonimage: "lib/assets/button.png",
      extraOptions: [
        ExtraOption(title: "Italy#1", subtitle: "Milan", signalStrength: 14),
        ExtraOption(title: "Italy#2", subtitle: "Milan", signalStrength: 23),
        ExtraOption(title: "Italy#3", subtitle: "Turin", signalStrength: 54),
        ExtraOption(title: "Italy#4", subtitle: "Turin", signalStrength: 81),
      ],
    ),
    Country(
      imagePath: "lib/assets/nl Netherlands.png",
      name: "Netherlands",
      locationCount: "12 locations",
      buttonimage: "lib/assets/button2.png",
      extraOptions: [],
    ),
    Country(
      imagePath: "lib/assets/Germany.png",
      name: "Germany",
      locationCount: "10 locations",
      buttonimage: "lib/assets/button2.png",
      extraOptions: [],
    ),
  ];

  final List<Country> premiumCountries = [
    Country(
      imagePath: "lib/assets/US.png",
      name: "United States",
      locationCount: "35 locations",
      buttonimage: "lib/assets/button2.png",
      extraOptions: [],
    ),
    Country(
      imagePath: "lib/assets/Brazil.png",
      name: "Brazil",
      locationCount: "16 locations",
      buttonimage: "lib/assets/button2.png",
      extraOptions: [],
    ),
    Country(
      imagePath: "lib/assets/France.png",
      name: "France",
      locationCount: "27 locations",
      buttonimage: "lib/assets/button2.png",
      extraOptions: [],
    ),
    Country(
      imagePath: "lib/assets/Canada.png",
      name: "Canada",
      locationCount: "21 locations",
      buttonimage: "lib/assets/button2.png",
      extraOptions: [],
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: CustomSidebarMenu(onItemSelected: (String) {}),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CountriesHeader(),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Text(
                "Free Locations(${freeCountries.length})",
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.60),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: freeCountries.length,
              itemBuilder: (context, index) {
                final country = freeCountries[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: ExpansionTile(

                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          country.imagePath,
                          height: 30,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        country.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        country.locationCount,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            country.buttonimage,
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.20),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "lib/assets/arrow-right.png",
                              height: 45,
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      children: country.extraOptions.map((option) {
                        Color wifiColor;
                        if (option.signalStrength < 30) {
                          wifiColor = Colors.red;
                        } else if (option.signalStrength < 60) {
                          wifiColor = Colors.orange;
                        } else {
                          wifiColor = Colors.green;
                        }

                        return ListTile(
                          title: Text(
                            option.title,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            option.subtitle,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${option.signalStrength}%",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.wifi, color: wifiColor),
                              SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.10),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "lib/assets/Frame 24.png",
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Text(
                "Premium Locations(${premiumCountries.length})",
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.60),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: premiumCountries.length,
              itemBuilder: (context, index) {
                final country = premiumCountries[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          country.imagePath,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        country.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        country.locationCount,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "lib/assets/Frame 22.png",
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.20),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "lib/assets/arrow-right.png",
                              height: 45,
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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


class CountriesHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/Frame 25.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Image.asset("lib/assets/appbarimage.png"),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Text(
                "Countries",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Image.asset("lib/assets/appbarimage2.png"),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 320,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search countries or locations",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.40),
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.black.withOpacity(0.40), size: 40,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Country {
  final String imagePath;
  final String name;
  final String locationCount;
  final String buttonimage;
  final List<ExtraOption> extraOptions;

  Country({
    required this.imagePath,
    required this.name,
    required this.locationCount,
    required this.buttonimage,
    required this.extraOptions,
  });
}

class ExtraOption {
  final String title;
  final String subtitle;
  final int signalStrength; // 0-100

  ExtraOption({
    required this.title,
    required this.subtitle,
    required this.signalStrength,
  });
}