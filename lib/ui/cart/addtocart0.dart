import 'package:final_project/ui/payment/invoice.dart';
import 'package:flutter/material.dart';

class ProductDeselectionScreen extends StatefulWidget {
  const ProductDeselectionScreen({super.key});

  @override
  _ProductDeselectionScreenState createState() =>
      _ProductDeselectionScreenState();
}

class _ProductDeselectionScreenState extends State<ProductDeselectionScreen> {
  int quantity = 1; // Variable to track the quantity

  void incrementQuantity() {
    setState(() {
      quantity++; // Increase quantity by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            const Text(
              'Deselect All Items',
              style: TextStyle(
                fontWeight: FontWeight.bold, // Bold text
                fontSize: 20, // Adjust font size if needed
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Card inside a box
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color for the box
                borderRadius: BorderRadius.circular(15), // Rounded corners
                border: Border.all(color: Colors.grey), // Border around the box
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Model Name
                  const Text(
                    'Apple 16-inch MacBook Pro M2 (2023 - Latest)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Centered Product Image
                  Center(
                    child: SizedBox(
                      height: 150, // Adjust height as needed
                      child: Image.asset(
                        'assets/images/msi.png', // Replace with your image file
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Product Details
                  const Text('CPU: Apple M2 chip'),
                  const Text('Ram: 16GB'),
                  const Text('Refresh Rate: refresh rates up to 120Hz'),
                  const Text('Storage: 512GB or 1TB'),
                  const Text('Color: Black'),
                  const SizedBox(height: 8),
                  const Text(
                    'Price: \$1,499',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                  ),
                  const Text('Free Delivery on 14th Feb 2025'),
                  const Text('Free Returns In Stock'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Action Buttons Row
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Delete Button
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // Save For Later Button
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Save For Later',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // Quantity Box
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.white),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 5),

                    // Quantity Text
                    GestureDetector(
                      onTap: incrementQuantity,
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: incrementQuantity,
                      icon: const Icon(Icons.add, color: Colors.white),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Checkout Button (Fixed)
          const SizedBox(height: 30),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 65),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InvoiceScreen()), // Ensure RegisterPage exists
                      );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Proceed to checkout ($quantity item${quantity > 1 ? 's' : ''})',
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
