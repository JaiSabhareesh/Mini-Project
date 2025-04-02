import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme
      body: Column(
        children: [
          const SizedBox(height: 40),
          // Profile Image
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('lib/images/profile.jpg'), // Update with actual image
          ),
          const SizedBox(height: 10),
          const Text(
            "Heeraa",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Menu Items
          _buildMenuItem(Icons.person, "User Profile"),
          _buildMenuItem(Icons.bookmark, "Bookmarks"),
          _buildMenuItem(Icons.notifications, "Notifications"),
          _buildMenuItem(Icons.home, "Home"),
          _buildMenuItem(Icons.people, "Community"),
          _buildMenuItem(Icons.settings, "Settings"),

          // Logout Button
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Implement logout logic
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  // Menu Item Widget
  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {},
    );
  }
}
