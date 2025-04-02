import 'package:flutter/material.dart';

class CarEngineOilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check and Top Up Engine Oil"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Here is a solution:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            _buildStep(
              stepTitle: "Step 1: Check the oil level",
              gifPath: "lib/images/gifs/check_oil.gif",
              description:
                  "Park on a flat surface, turn off the engine, and let the oil settle. Open the hood, pull out the dipstick, clean it, reinsert it, and check the oil level.",
            ),
            _buildStep(
              stepTitle: "Step 2: Inspect the oil condition",
              gifPath: "lib/images/gifs/inspect_oil.gif",
              description:
                  "Examine the oil on the dipstick. It should be smooth and amber-colored. If it’s dark, gritty, or smells burnt, it may be time for an oil change.",
            ),
            _buildStep(
              stepTitle: "Step 3: Add engine oil",
              gifPath: "lib/images/gifs/add_oil.gif",
              description:
                  "If the oil level is low, locate the oil filler cap. Remove the cap and slowly pour in the recommended oil type for your car, a little at a time, using a funnel to avoid spills.",
            ),
            _buildStep(
              stepTitle: "Step 4: Recheck and finalize",
              gifPath: "lib/images/gifs/recheck_oil.gif",
              description:
                  "After adding oil, wait a moment, then use the dipstick to check the level again to ensure it’s within the recommended range. Once done, securely close the oil cap and hood.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({required String stepTitle, required String gifPath, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          stepTitle,
          style: const TextStyle(
            color: Colors.lightBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            gifPath,
            height: 150, // Keeping original height
            width: double.infinity,
            fit: BoxFit.contain, // Makes sure the GIF fits inside without getting enlarged
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
