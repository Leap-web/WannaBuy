import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

class BrowseItem extends StatefulWidget {
  const BrowseItem({super.key});

  @override
  State<BrowseItem> createState() => _BrowseItemState();
}

class _BrowseItemState extends State<BrowseItem> {
  // List of all products
  List<Map<String, String>> allProducts = [
    {
      "name": "Asus Laptop",
      "price": "\$999",
      "image": "assets/images/laptop.png",
    },
    {
      "name": "iPhone 15 Pro Max",
      "price": "\$1499",
      "image": "assets/images/phone.png",
    },
    {
      "name": "MSI Gaming Laptop",
      "price": "\$1299",
      "image": "assets/images/msi.png",
    },
    {
      "name": "Wireless Headset",
      "price": "\$199",
      "image": "assets/images/earphone.png",
    },
    {
      "name": "Dell Laptop",
      "price": "\$1199",
      "image": "assets/images/dell.png",
    },
    {
      "name": "Lenovo Laptop",
      "price": "\$1099",
      "image": "assets/images/lenovo.png",
    },
    {
      "name": "iPhone 14",
      "price": "\$999",
      "image": "assets/images/iphone14.png",
    },
    {
      "name": "Apple AirPods Max",
      "price": "\$549",
      "image": "assets/images/airpod.png",
    },
  ];

  // Updated allProducts list with details
  List<Map<String, dynamic>> productDetials = [
    {
      "name": "Asus Laptop",
      "price": "\$999",
      "image": "assets/images/laptop.png",
      "details": {
        "CPU": "8-Core CPU",
        "GPU": "8-Core GPU",
        "Memory": "16GB Unified Memory",
        "Storage": "256GB SSD Storage",
        "NeuralEngine": "16-core Neural Engine",
        "Display": "13.6-inch Liquid Retina display with True Tone",
        "Camera": "1080p FaceTime HD camera",
        "ChargingPort": "MagSafe 3 charging port",
        "USBPorts": "Two Thunderbolt / USB 4 ports",
        "ExternalDisplay": "Support for one external display",
        "Keyboard": "Magic Keyboard with Touch ID",
        "Trackpad": "Force Touch trackpad",
        "PowerAdapter": "30W USB-C Power Adapter",
      },
    },
    {
      "name": "iPhone 15 Pro Max",
      "price": "\$1,499",
      "image": "assets/images/iphone.png",
      "details": {
        "CPU": "A17 Pro Chip",
        "GPU": "Next-generation GPU with 6-core design",
        "Memory": "6GB RAM",
        "Storage": "128GB / 256GB / 512GB / 1TB",
        "NeuralEngine": "16-core Neural Engine",
        "Display": "6.7-inch Super Retina XDR display",
        "Camera": "48MP Main, 12MP Ultra Wide, 12MP Telephoto",
        "ChargingPort": "Lightning port",
        "USBPorts": "USB-C with 20W fast charging",
        "ExternalDisplay": "AirPlay for wireless display",
        "Keyboard": "N/A (iOS virtual keyboard)",
        "Trackpad": "N/A (Touchscreen)",
        "PowerAdapter": "20W USB-C Power Adapter",
      },
    },
    {
      "name": "Apple AirPods Max",
      "price": "\$549",
      "image": "assets/images/airpods_max.png",
      "details": {
        "Chip": "Apple H1 chip (per ear cup)",
        "Audio": "High-fidelity audio with active noise cancellation",
        "NoiseCancellation": "Active Noise Cancellation & Transparency Mode",
        "BatteryLife":
            "Up to 20 hours of listening time with Active Noise Cancellation and spatial audio",
        "ChargingCase": "Smart Case for battery preservation",
        "Weight": "384.8 grams",
        "HeadphoneType": "Over-Ear",
        "Connectivity": "Bluetooth 5.0",
        "Microphone":
            "Nine microphones for noise cancellation and voice pickup",
        "Controls": "Digital crown for volume control, play/pause, skip tracks",
        "AudioFormat": "Spatial audio with dynamic head tracking",
        "ColorOptions": "Space Gray, Silver, Sky Blue, Green, Pink",
        "AdditionalFeatures":
            "Automatic switching between devices, Hey Siri functionality",
      },
    },

    {
      "name": "Lenovo Laptop",
      "price": "\$1799",
      "image": "assets/images/lenovo_x1_carbon.png",
      "details": {
        "CPU": "Intel Core i7-1265U",
        "GPU": "Intel Iris Xe Graphics",
        "Memory": "16GB LPDDR5 RAM",
        "Storage": "512GB SSD",
        "NeuralEngine": "N/A",
        "Display": "14-inch WQXGA (2560 x 1600) IPS display",
        "Camera": "1080p HD camera with IR",
        "ChargingPort": "USB-C with Power Delivery",
        "USBPorts": "Two Thunderbolt 4 ports, One USB 3.2 Type-A",
        "ExternalDisplay": "Supports up to two external displays",
        "Keyboard": "Backlit keyboard with TrackPoint",
        "Trackpad": "Precision touchpad with multi-touch support",
        "PowerAdapter": "65W USB-C Power Adapter",
      },
    },

    {
      "name": "Dell Laptop",
      "price": "\$1199",
      "image": "assets/images/dell_xps13.png",
      "details": {
        "CPU": "Intel Core i7-1360P",
        "GPU": "Intel Iris Xe Graphics",
        "Memory": "16GB LPDDR5 RAM",
        "Storage": "512GB SSD",
        "NeuralEngine": "N/A",
        "Display": "13.4-inch FHD+ (1920 x 1200) InfinityEdge display",
        "Camera": "720p HD webcam",
        "ChargingPort": "USB-C charging",
        "USBPorts": "Two Thunderbolt 4 ports",
        "ExternalDisplay": "Supports up to two external displays",
        "Keyboard": "Backlit Keyboard with Fingerprint Reader",
        "Trackpad": "Precision Glass Touchpad",
        "PowerAdapter": "45W USB-C Power Adapter",
      },
    },
    {
      "name": "iPhone 14",
      "price": "\$999",
      "image": "assets/images/iphone14.png",
      "details": {
        "CPU": "A15 Bionic chip",
        "GPU": "5-core GPU",
        "Memory": "6GB RAM",
        "Storage": "128GB / 256GB / 512GB",
        "NeuralEngine": "16-core Neural Engine",
        "Display": "6.1-inch Super Retina XDR display",
        "Camera": "12MP Main, 12MP Ultra Wide",
        "ChargingPort": "Lightning port",
        "USBPorts": "N/A",
        "ExternalDisplay": "AirPlay for wireless display",
        "Keyboard": "N/A (iOS virtual keyboard)",
        "Trackpad": "N/A (Touchscreen)",
        "PowerAdapter": "20W USB-C Power Adapter",
      },
    },

    {
      "name": "Wireless Headset",
      "price": "\$199",
      "image": "assets/images/earphone.png",
      "details": {
        "CPU": "Apple H2 Chip",
        "GPU": "N/A",
        "Memory": "N/A",
        "Storage": "N/A",
        "NeuralEngine": "Custom Apple Silicon",
        "Display": "N/A",
        "Camera": "N/A",
        "ChargingPort": "Lightning and MagSafe charging",
        "USBPorts": "N/A",
        "ExternalDisplay": "N/A",
        "Keyboard": "N/A",
        "Trackpad": "N/A",
        "PowerAdapter": "N/A (Charging Case)",
      },
    },
    {
      "name": "MSI Gaming Laptop",
      "price": "\$1,299",
      "image": "assets/images/msi.png",
      "details": {
        "CPU": "Intel Core i9-12900HK",
        "GPU": "NVIDIA GeForce RTX 3080",
        "Memory": "32GB DDR4 RAM",
        "Storage": "1TB SSD",
        "NeuralEngine": "N/A",
        "Display": "17.3-inch Full HD 360Hz",
        "Camera": "720p HD webcam",
        "ChargingPort": "USB-C Charging",
        "USBPorts": "Two USB-A 3.2, One USB-C, One USB 3.2 Type-C",
        "ExternalDisplay": "Supports up to three external displays",
        "Keyboard": "RGB Backlit Keyboard",
        "Trackpad": "Precision Trackpad",
        "PowerAdapter": "230W Power Adapter",
      },
    },

    // Add other products similarly
  ];

  // Filtered products list to display
  List<Map<String, String>> filteredProducts = [];

  // The selected category (this will track the selected category)
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(allProducts); // Initialize with all products
  }

  // Function to filter products based on search query
  void filterProducts(String query) {
    setState(() {
      filteredProducts =
          allProducts
              .where(
                (product) => product["name"]!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  Map<String, dynamic> getProductDetails(String productName) {
    try {
      return productDetials.firstWhere(
        (product) => product['name'] == productName,
      )['details'];
    } catch (e) {
      return {}; // Return an empty map if no product details are found
    }
  }

  // Function to create rows with two items per row
  List<Widget> buildProductRows() {
    List<Widget> rows = [];
    for (int i = 0; i < filteredProducts.length; i += 2) {
      int nextIndex = (i + 1 < filteredProducts.length) ? i + 1 : i;

      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20), // Space between rows
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Evenly space the boxes
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ), // Add horizontal spacing
                  child: ProductBox(
                    rating: 4,
                    imagePath: filteredProducts[i]["image"]!,
                    modelName: filteredProducts[i]["name"]!,
                    details: getProductDetails(filteredProducts[i]["name"]!),
                    price: double.parse(
                      filteredProducts[i]["price"]!.substring(1),
                    ),
                  ),
                ),
              ),
              if (i + 1 < filteredProducts.length)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ), // Add horizontal spacing
                    child: ProductBox(
                      rating: 4,
                      imagePath: filteredProducts[nextIndex]["image"]!,
                      modelName: filteredProducts[nextIndex]["name"]!,
                      details: getProductDetails(
                        filteredProducts[nextIndex]["name"]!,
                      ),
                      price: double.parse(
                        filteredProducts[nextIndex]["price"]!.substring(1),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return rows;
  }
  // Function to handle category selection
  void _onCategoryTap(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        filteredProducts = List.from(allProducts);
      } else if (category == 'Laptop' || category == 'Macbook') {
        filteredProducts =
            allProducts.where((product) {
              String name = product["name"]!.toLowerCase();
              return name.contains('laptop') || name.contains('macbook');
            }).toList();
      } else if (category == 'Earphone') {
        filteredProducts =
            allProducts.where((product) {
              return product["name"]!.toLowerCase().contains('headset') ||
                  product["name"]!.toLowerCase().contains('airpod');
            }).toList();
      } else {
        filteredProducts =
            allProducts.where((product) {
              return product["name"]!.toLowerCase().contains(
                category.toLowerCase(),
              );
            }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Black Section (Covers AppBar & Search)
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.account_circle,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.calendar_month,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.notifications,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Find best device for\nyour setup!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: TextField(
                        onChanged:
                            filterProducts, // Call function on text change
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[800],
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hot Deals 🔥",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Ads Container (No change)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/ads.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Categories Row (No change)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryBox(
                    title: 'All',
                    imagePath: 'assets/images/all.png',
                    isSelected:
                        selectedCategory == 'All', // Pass selected state
                    onTap: () => _onCategoryTap('All'),
                  ),
                  CategoryBox(
                    title: 'Laptop',
                    imagePath: 'assets/images/laptop.png',
                    isSelected:
                        selectedCategory == 'Laptop' ||
                        selectedCategory == 'Macbook', // Pass selected state
                    onTap: () => _onCategoryTap('Laptop'),
                  ),
                  CategoryBox(
                    title: 'Phone',
                    imagePath: 'assets/images/phone.png',
                    isSelected:
                        selectedCategory == 'Phone', // Pass selected state
                    onTap: () => _onCategoryTap('Phone'),
                  ),
                  CategoryBox(
                    title: 'Earphone',
                    imagePath: 'assets/images/earphone.png',
                    isSelected:
                        selectedCategory == 'Earphone', // Pass selected state
                    onTap: () => _onCategoryTap('Earphone'),
                  ),
                ],
              ),
            ),

            // Display the filtered products in two boxes per row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Column(
                children: buildProductRows(), // Display rows with 2 products
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Box Widget
class CategoryBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected; // Add this to check if the category is selected
  final VoidCallback onTap; // Add this callback for onTap

  const CategoryBox({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected, // Accept isSelected as a parameter
    required this.onTap, // Accept onTap callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use onTap callback here
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.white
                  : Colors.grey[300], // Change color based on selection
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 30, height: 30),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color:
                    isSelected ? Colors.black : Colors.black.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Product Box Widget
class ProductBox extends StatelessWidget {
  final String modelName;
  final String imagePath;
  final double price;
  final Map<String, dynamic> details; // Product details passed
  final double rating;

  const ProductBox({
    super.key,
    required this.modelName,
    required this.imagePath,
    required this.price,
    required this.details, // Initialize with details
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => Detail(
                    productName: modelName,
                    productImage: imagePath,
                    rating: rating,
                    price: price,
                    productDetails: details,
                  ), // Pass the details here
            ),
          ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 100, // Adjust the size as needed
                  height: 100, // Adjust the size as needed
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Product Name and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                modelName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "\$$price",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Rating Section
          ],
        ),
      ),
    );
  }
}
