import 'package:flutter/material.dart';

class JumpStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("How to Jump Start a Car"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Here is a solution:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Step 1
            Image.asset('lib/images/gifs/step1.gif'),
            const SizedBox(height: 10),
            const Text(
              "Park both vehicles close enough for the jumper cables to reach. "
              "Turn off both engines and ensure all electrical systems (lights, radio) are off.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Step 2
            Image.asset('lib/images/gifs/step2.gif'),
            const SizedBox(height: 10),
            const Text(
              "Attach the red clip to both car batteries' positive (+) ends. "
              "Attach one black clip to the working battery's negative (-) end and the other to metal on the dead car.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Step 3
            Image.asset('lib/images/gifs/step3.gif'),
            const SizedBox(height: 10),
            const Text(
              "Turn on the working car and let it run for a few minutes to transfer power to the dead battery.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Step 4
            Image.asset('lib/images/gifs/step4.gif'),
            const SizedBox(height: 10),
            const Text(
              "Try starting the car with the dead battery. Once it starts, "
              "disconnect the jumper cables in reverse order and let the car run for a while to recharge the battery.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
