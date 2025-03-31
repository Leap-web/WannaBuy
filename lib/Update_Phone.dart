import 'package:final_project/user_profile.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        actions: [], // No share icon
        title: Text('Change Phone Number'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update phone number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your phone number',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Your Phone Number',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  // Box border
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  borderSide: BorderSide(color: Colors.black), // Black border
                ),
                enabledBorder: OutlineInputBorder(
                  // Box border when enabled
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  // Box border when focused
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ), // Thicker border when focused
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ), // Black phone icon
                filled: true, // Filled background
                fillColor: Colors.white, // White background
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ), // Inner padding
              ),
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.black), // Black text
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigation to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()),
                  ); // Replace NextScreen() with your actual screen widget
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Custom background color
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ), // Reduced vertical padding
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ), // Full width, reduced height
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 14, // Smaller font size
                    fontWeight: FontWeight.w500, // Optional: medium weight
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
