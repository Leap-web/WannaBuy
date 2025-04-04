import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> categories = [
    {"title": "Gaming Laptop", "image": "assets/images/gaminglaptop.jpg"},
    {"title": "Laptop Office", "image": "assets/images/officelaptop.jpeg"},
    {"title": "Gaming", "image": "assets/images/gamingacc.png"},
    {"title": "Phone", "image": "assets/images/phone.jpeg"},
    {"title": "Monitor", "image": "assets/images/monitor.jpg"},
    {"title": "Headset", "image": "assets/images/headset.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
    
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title (moved up since we removed the time)
              const Text(
                'What are you looking for?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),

              // Search Bar
              Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                       child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8), // Shadow color
                                spreadRadius: 3, // How much the shadow spreads
                                blurRadius: 10, // Softness of the shadow
                                offset: Offset(0, 4), // Position of the shadow (X, Y)
                              ),
                            ],
                          ),
                      child: TextField(
                      // Call function on text change
                          decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
      
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(color: Colors.black, width: 2), 
                           // Color when focused
                           ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                      ),
                    ),
              const SizedBox(height: 35),

              // Trending Categories
              const Text(
                "Trending Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // GridView for categories
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.6,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      title: categories[index]["title"]!,
                      image: categories[index]["image"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;

  const CategoryCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}