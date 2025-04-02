import 'package:flutter/material.dart';

class CarPuncturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Fix a Punctured Tire', style: TextStyle(color: Colors.white, fontSize: 22)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How can I fix a punctured car tire step by step?',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Difficulty: Easy',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            const SizedBox(height: 16),

            _buildStep(
              title: 'Step 1: Locate the puncture',
              gifPath: 'lib/images/gifs/locate_puncture.gif',
              description: 'Inspect the tire thoroughly to find the puncture or leak. '
                  'You can do this visually or by pouring soapy water on the tire—look for bubbles indicating the puncture spot.',
            ),

            _buildStep(
              title: 'Step 2: Remove the tire (if necessary)',
              gifPath: 'lib/images/gifs/remove_tire.gif',
              description: 'If the puncture isn’t accessible, remove the tire using a jack and a wrench. '
                  'Ensure the car is securely supported while you work.',
            ),

            _buildStep(
              title: 'Step 3: Repair the puncture',
              gifPath: 'lib/images/gifs/repair_puncture.gif',
              description: 'If the puncture is small, use a tire repair kit. '
                  'These typically include a rubber plug and tools to insert it into the hole. '
                  'Follow the kit’s instructions carefully to seal the puncture.',
            ),

            _buildStep(
              title: 'Step 4: Reinstall and test',
              gifPath: 'lib/images/gifs/reinstall_tire.gif',
              description: 'Reinflate the tire to the recommended pressure, reinstall it (if removed), '
                  'and test for any remaining leaks by driving briefly or checking with soapy water again.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({required String title, required String gifPath, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 150, // Reverted height back to 150
            width: double.infinity, // Full width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              gifPath,
              fit: BoxFit.contain, // Ensures the GIF fits properly without stretching
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }
}
