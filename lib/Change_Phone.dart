import 'package:final_project/Update_Phone.dart';
import 'package:flutter/material.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('assets/images/image.png', height: 150),
            ),
            SizedBox(height: 25),
            Text(
              'Change Phone Number',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'This will transfer your account from your\ncurrent phone number to a new number.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigation to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneNumber()),
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
