import 'package:flutter/material.dart';

class BikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Bike Issues', style: TextStyle(color: Colors.white)),
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

            // Recommended Bike Issues Header
            const Text(
              "Recommended - Bike",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // List of Bike Issues
            Expanded(
              child: ListView(
                children: [
                  _buildIssueCard(
                    'lib/images/bike_coolant.png', // Update with actual image path
                    "How do I change Coolant oil in my bike?",
                    "Easy",
                    "777",
                  ),
                  _buildIssueCard(
                    'lib/images/brake_calipers.png', // Update with actual image path
                    "How do I tighten break calipers",
                    "Easy",
                    "129",
                  ),
                  _buildIssueCard(
                    'lib/images/chain_lube.png', // Update with actual image path
                    "How do I apply chain lube?",
                    "Medium",
                    "92",
                  ),
                  _buildIssueCard(
                    'lib/images/steering_issues.png', // Update with actual image path
                    "How do I sort Steering Issues",
                    "Easy",
                    "43",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build issue cards
  Widget _buildIssueCard(String imagePath, String title, String difficulty, String views) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          // Title and Details
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "Difficulty : $difficulty",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$views 👀", // Views count
                      style: TextStyle(color: Colors.white54),
                    ),
                    Icon(Icons.favorite, color: Colors.white54, size: 18), // Placeholder for a like button
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
