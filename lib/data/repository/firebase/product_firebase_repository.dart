// import 'package:firebase_database/firebase_database.dart';
// import 'package:final_project/data/repository/product_repository.dart';
// import 'package:final_project/model/product.dart';

// class ProductFirebaseRepository extends ProductRepository {
//   final DatabaseReference _database = FirebaseDatabase.instance.ref();

//   @override
//   Future<bool> addProductToCart(Product product) async {
//     try {
//       // Push the product to the "cart" node in the database
//       await _database.child('cart').push().set(product.toMap());
//       return true;
//     } catch (e) {
//       print('Error adding product to cart: $e');
//       return false;
//     }
//   }

//   @override
//   Future<List<Product>> getCartProducts() async {
//     try {
//       // Retrieve the list of products from the "cart" node
//       final snapshot = await _database.child('cart').get();
//       if (snapshot.exists) {
//         final data = snapshot.value as Map<dynamic, dynamic>;
//         return data.values
//             .map((productData) => Product.fromMap(Map<String, dynamic>.from(productData)))
//             .toList();
//       } else {
//         return [];
//       }
//     } catch (e) {
//       print('Error retrieving cart products: $e');
//       return [];
//     }
//   }

//   @override
//   Future<bool> removeProductFromCart(Product product) async {
//     try {
//       // Retrieve the "cart" node
//       final snapshot = await _database.child('cart').get();
//       if (snapshot.exists) {
//         final data = snapshot.value as Map<dynamic, dynamic>;
//         String? keyToRemove;

//         // Find the key of the product to remove
//         data.forEach((key, value) {
//           final productData = Map<String, dynamic>.from(value);
//           if (productData['name'] == product.name &&
//               productData['price'] == product.price &&
//               productData['image'] == product.image) {
//             keyToRemove = key;
//           }
//         });

//         if (keyToRemove != null) {
//           // Remove the product from the "cart" node
//           await _database.child('cart/$keyToRemove').remove();
//           return true;
//         }
//       }
//       return false;
//     } catch (e) {
//       print('Error removing product from cart: $e');
//       return false;
//     }
//   }
// }