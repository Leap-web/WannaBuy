import 'package:final_project/ui/profile/Change_Phone.dart';
import 'package:flutter/material.dart';
import '../home/browse.dart';
import '../history/orderhistory.dart'; // Make sure to import OrderHistoryScreen

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _currentIndex = 2; // Profile is the third tab, so index 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BrowseItem()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          'User Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/profile_picture.jpg',
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Plok Joy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(height: 1, color: Colors.black54),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFF4D4D4D),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  buildProfileButton(Icons.person, "Edit Profile"),
                  buildProfileButton(Icons.notifications, "Notification"),
                  buildProfileButton(Icons.location_on, "Shopping Address"),
                  buildProfileButton(Icons.history, "History Order"),
                  buildChangePhoneNumberButton(context),
                  buildProfileButton(Icons.favorite, "Add to Favorite"),
                  const SizedBox(height: 20),
                  buildLogoutButton(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Navigate to different pages based on index
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BrowseItem()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
              );
              break;
            case 2:
              // Already on profile page
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Order',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildProfileButton(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 20),
            const SizedBox(width: 15),
            Text(text, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget buildChangePhoneNumberButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChangePhoneNumberScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Row(
          children: [
            const Icon(Icons.phone, color: Colors.black, size: 20),
            const SizedBox(width: 15),
            const Text("Change Phone Number", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget buildLogoutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Add logout functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          minimumSize: const Size(150, 50),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout, color: Colors.white, size: 20),
            SizedBox(width: 10),
            Text("Log Out", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
