

class Cart {
  late final int? id;
  final String? productId;
  final String? productName;
  final int? intialPrice;
  final int? productPrice;
  final int? quantity;
  final String? image;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.intialPrice,
    required this.productPrice,
    required this.quantity,
    required this.image,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        intialPrice = res['intialPrice'],
        productPrice = res['productPrice'],
        quantity = res['quantity'],
        image = res['image'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'intialPrice': intialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'image': image,
    };
  }
}
