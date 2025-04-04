import '../../model/product.dart';

abstract class ProductRepository {
  /// Adds a product to the cart.
  /// 
  /// [product] is the product to be added.
  /// Returns `true` if the product was successfully added, otherwise `false`.
  Future<bool> addProductToCart(Product product);

  /// Retrieves the list of products in the cart.
  Future<List<Product>> getCartProducts();

  /// Removes a product from the cart.
  /// 
  /// [product] is the product to be removed.
  Future<bool> removeProductFromCart(Product product);
}