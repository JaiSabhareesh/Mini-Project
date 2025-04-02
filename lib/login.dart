import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text("Email", style: TextStyle(color: Colors.white)),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your email id",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text("Password", style: TextStyle(color: Colors.white)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Forgot password?", style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Dashboard using named route
                  Navigator.pushNamed(context, '/dashboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text("Not a user?", style: TextStyle(color: Colors.white))),
            SizedBox(height: 10),
            Center(child: Text("Or", style: TextStyle(color: Colors.white))),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/images/google.png', width: 40),
                SizedBox(width: 20),
                Image.asset('lib/images/facebook.png', width: 40),
                SizedBox(width: 20),
                Image.asset('lib/images/microsoft.png', width: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
