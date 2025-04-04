class Product {
  final String name;
  final String price;
  final String image;
  final Map<String, dynamic> details;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.details,
  });

  // Factory method to create a Product from a Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      price: map['price'] as String,
      image: map['image'] as String,
      details: map['details'] as Map<String, dynamic>,
    );
  }

  // Method to convert a Product to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'details': details,
    };
  }
}