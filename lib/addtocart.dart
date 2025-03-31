import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      // Body
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Cart Item(s)
          CartItemTile(),

          SizedBox(height: 20),

          // Suggested Products
          SuggestedProducts(),
        ],
      ),

      // Pinned Bottom Checkout Button
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white, // Ensures button area has a solid background
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {},
          child: Text(
            "Proceed to checkout (1 item)",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// CartItemTile: Demonstration of a single item in the cart
class CartItemTile extends StatefulWidget {
  @override
  _CartItemTileState createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Styling
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
      ),
      child: Column(
        children: [
          // Product Row: Image on left, description on right.
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/m4.png',
                  width: 100, // Adjust width as needed
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),

              // Product Info (description)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Apple 16-inch MacBook Pro M2 (2023 - Latest)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "RAM: 16GB • Storage: 512GB or 1TB",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "\$1,499",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // Optionally, you can include a Delete button to the far right.
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),

          // Quantity and Save for Later Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Quantity Selector with delete moved up (if desired)
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.black),
                    onPressed: _decrementQuantity,
                  ),
                  Text(
                    "$_quantity",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.black),
                    onPressed: _incrementQuantity,
                  ),
                ],
              ),
              SizedBox(width: 10),
              // Save for Later Button
              TextButton(
                onPressed: () {},
                child: Text(
                  "Save For Later",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// SuggestedProducts: Horizontal list of items
class SuggestedProducts extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "name": "IMAC Pro M3",
      "price": "\$1,459",
      "image":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-hero-202310?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1697130137988",
    },
    {
      "name": "TUF Gaming F15",
      "price": "\$669",
      "image":
          "https://www.asus.com/media/Odin/Websites/global/ProductLine/20210122023247.jpg",
    },
    {
      "name": "IMAC Pro M3",
      "price": "\$830",
      "image":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-hero-202310?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1697130137988",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pair with your cart",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                width: 100,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product["name"]!,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product["price"]!,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
