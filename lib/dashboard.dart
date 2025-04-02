import 'package:flutter/material.dart';
import 'car_page.dart'; // Import CarPage
import 'bike_page.dart'; // Import BikePage
import 'community.dart'; // Import CommunityPage
import 'profile.dart'; // ✅ Import ProfilePage

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Implement notifications later
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            // ✅ User Profile Section in Drawer
            UserAccountsDrawerHeader(
              accountName: const Text('Heeraa', style: TextStyle(color: Colors.white)),
              accountEmail: null,
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('lib/images/profile.jpg'), // Replace with actual image
              ),
              decoration: const BoxDecoration(color: Colors.black),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('User Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark, color: Colors.white),
              title: const Text('Bookmarks', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white),
              title: const Text('Notifications', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close drawer and stay on Dashboard
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.white),
              title: const Text('Community', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  // Implement logout logic
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for issues',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Full-width Image Banner
            Container(
              width: double.infinity,
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('lib/images/image.png'), // Update with your actual image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Grid of Category Buttons (Smaller Cards)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.4, // Making the cards smaller
                children: [
                  _buildCategoryButton('Cars', Icons.directions_car, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarPage()),
                    );
                  }),
                  _buildCategoryButton('Bikes', Icons.motorcycle, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BikePage()),
                    );
                  }),
                  _buildCategoryButton('Bicycles', Icons.pedal_bike, () {}),
                  _buildCategoryButton('More >>>', Icons.more_horiz, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white54,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPage()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())); // ✅ Navigate to Profile
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'), // ✅ Changed to Profile
        ],
      ),
    );
  }

  // Function to build category buttons with navigation
  Widget _buildCategoryButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue, size: 50),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
