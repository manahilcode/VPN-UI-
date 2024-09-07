
import 'package:countries_ui/countries_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CountiresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF0F5F5),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image.asset(
                    'lib/assets/splashscreenimage.png',
                    height: 328,
                    width: 300,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Secure Browsing\nWith No Limits',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                      child: Text(
                        'With Our Encrypted VPN Tunnel, Your Data Stays Safe, Even Over Public Or Untrusted Internet Connections.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Container(
                  height: 3,
                  width: 20,
                      color: Color(0xFF00091F).withOpacity(0.50)
                ),
                    SizedBox(width: 2),
                    Icon(Icons.circle, size: 5,color: Color(0xFF00091F).withOpacity(0.50)
                      , ),
                    SizedBox(width: 2),
                    Icon(Icons.circle, size: 5, color: Color(0xFF00091F).withOpacity(0.50)),
                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Countries()),
                        );
                      },
                      child: Container(
                        height:56,
                        width: 320,

                        decoration: BoxDecoration(
                          color: Color(0xFF185BFF),
                         borderRadius: BorderRadius.circular(20),
                        ),

                        child: Center(
                          child: Text(
                            'Create An Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF185BFF),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
