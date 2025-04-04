import 'package:final_project/ui/home/browse.dart';
import 'package:flutter/material.dart';
import '../cart/addtocart0.dart';
import '../history/orderhistory.dart';
import '../profile/user_profile.dart';

class Detail extends StatefulWidget {
  final String productName;
  final String productImage;
  final double rating;
  final double price;
  final Map<String, dynamic> productDetails;

  const Detail({
    super.key,
    required this.productName,
    required this.productImage,
    required this.rating,
    required this.price,
    required this.productDetails,
  });

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isFavorite = false;
  int quantity = 1;
  int _currentIndex = 0; // Added state for bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Details',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 40), // Spacer for alignment
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Box
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Image.asset(
                    widget.productImage,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Preview",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Color Section
            Text(
              "Colors",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _colorCircle(Colors.grey),
                _colorCircle(Colors.black),
                _colorCircle(Colors.white),
                _colorCircle(const Color.fromARGB(255, 13, 59, 97)),
              ],
            ),

            SizedBox(height: 20),

            // Product Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  widget.productDetails.entries.map((entry) {
                    bool isBold = [
                      "CPU",
                      "GPU",
                      "Memory",
                      "Storage",
                    ].contains(entry.key);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        ". ${entry.key}: ${entry.value}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              isBold ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  }).toList(),
            ),

            SizedBox(height: 20),

            // Price Section
            Text(
              "\$${widget.price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Add to Cart Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Favorite Icon
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),

                // Add to Cart Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDeselectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.shopping_cart, color: Colors.white, size: 20),
                    ],
                  ),
                ),

                // Quantity Selector
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text(
                        "$quantity",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Fixed Bottom Navigation Bar
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
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

  Widget _colorCircle(Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
