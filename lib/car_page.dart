import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> carIssues = [
    {
      'title': 'How can I fix a punctured car tire step by step?',
      'difficulty': 'Difficulty: Easy',
      'imagePath': 'lib/images/tire_repair.jpg',
      'views': '118',
      'route': '/car_puncture',
    },
    {
      'title': 'How do I check and top up engine oil?',
      'difficulty': 'Difficulty: Easy',
      'imagePath': 'lib/images/engine_oil.jpg',
      'views': '774',
      'route': '/car_engineoil',
    },
    {
      'title': 'How do I jump start my car safely?',
      'difficulty': 'Difficulty: Medium',
      'imagePath': 'lib/images/jump_start.jpg',
      'views': '92',
      'route': '/jump_start', // Added route
    },
    {
      'title': 'What should I do if my car overheats?',
      'difficulty': 'Difficulty: Easy',
      'imagePath': 'lib/images/overheat.jpg',
      'views': '127',
    },
  ];

  List<Map<String, String>> filteredCarIssues = [];

  @override
  void initState() {
    super.initState();
    filteredCarIssues = carIssues;
  }

  void _searchIssues() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCarIssues = carIssues
          .where((issue) => issue['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Cars', style: TextStyle(color: Colors.white, fontSize: 24)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search for issues',
                        hintStyle: TextStyle(color: Colors.white54, fontSize: 18),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.white, size: 26),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white, size: 26),
                    onPressed: _searchIssues,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Section Title
            const Text(
              'Recommended - Cars',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            // List of Car Issues
            Expanded(
              child: filteredCarIssues.isEmpty
                  ? const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(color: Colors.white54, fontSize: 18),
                      ),
                    )
                  : ListView(
                      children: filteredCarIssues.map((issue) {
                        return _buildCarIssueCard(
                          issue['title']!,
                          issue['difficulty']!,
                          issue['imagePath']!,
                          issue['views']!,
                          issue['route'],
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Individual Car Issue Card
  Widget _buildCarIssueCard(String title, String difficulty, String imagePath, String views, String? route) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route);
        } else {
          print("No route defined for this item");
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Issue Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // Issue Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      difficulty,
                      style: const TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            // Views Counter
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                children: [
                  const Icon(Icons.visibility, color: Colors.white54, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    views,
                    style: const TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
