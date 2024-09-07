import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSidebarMenu extends StatelessWidget {
  final Function(String) onItemSelected;

  CustomSidebarMenu({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 5, right: 5, bottom: 20),
            child: Container(
              height: 80,
              width: 330,
              decoration: BoxDecoration(
                color: Color(0xFF185BFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.withOpacity(0.70),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      ),
                      child: Center(child: Image.asset("lib/assets/sidebar.png")),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 5),
                        child: Text('User Name', style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 5),
                        child: Text('Disconnected', style: GoogleFonts.montserrat(color: Colors.white70)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Main Menu', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          _buildMenuItem('lib/assets/sidebar1.png', 'Setting'),
          _buildMenuItem('lib/assets/sidebar2.png', 'Account'),
          _buildMenuItem('lib/assets/eye.png', 'Show Log'),
          _buildMenuItem('lib/assets/note.png', 'Report'),
          _buildMenuItem('lib/assets/emoji-happy.png', 'Help'),
          _buildMenuItem('lib/assets/logout .png', 'Sign Out'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String imagePath, String title) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 24,   // Set the width of the image
        height: 24,  // Set the height of the image
        fit: BoxFit.contain,  // Adjust the fit of the image
      ),
      title: Text(title),
      onTap: () => onItemSelected(title),
    );
  }
}
