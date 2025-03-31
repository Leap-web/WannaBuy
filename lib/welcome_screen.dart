import 'package:flutter/material.dart';
import 'package:final_project/signin_screen.dart';
import 'package:final_project/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('assets/images/background.png', fit: BoxFit.cover),

          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top spacing
                  const SizedBox(height: 80),

                  // "WELCOME BACK" text
                  const Text(
                    "WELCOME BACK",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 180),

                  // "WANNABUY" logo/text - Using Image widget instead of Text
                  SizedBox(
                    width: 250,
                    height: 150,
                    child: Image.asset(
                      'assets/images/wannabuy.jpg',
                      fit: BoxFit.contain,
                    ), // Make sure this path is correct// Adjust height as needed
                  ),
                  const SizedBox(height: 0),

                  // SIGN IN button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black,
                    ),

                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // SIGN UP button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black,
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),

                  // "Join As Guest" text button
                  TextButton(
                    onPressed: () {
                      // Add guest login functionality
                    },
                    child: const Text(
                      '-- Join As Guest --',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),

                  // "Login As" text
                  const Text(
                    'Login As',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Apple Icon
                      IconButton(
                        icon: const Icon(Icons.apple, size: 40),
                        onPressed: () {
                          // Handle Apple login
                        },
                      ),
                      const SizedBox(width: 20), // Spacing between icons
                      // Google Icon
                      IconButton(
                        icon: Image.asset(
                          'assets/images/google.png', // Make sure to add this image to your assets
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Handle Google login
                        },
                      ),
                      const SizedBox(width: 20), // Spacing between icons
                      // Facebook Icon
                      IconButton(
                        icon: const Icon(
                          Icons.facebook,
                          size: 40,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
