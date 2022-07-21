class CartModel {
  String?
      shopName,
      productName,
      productPrice,
      productCategory,
      productImage,
      userName;

  CartModel(
      {
      this.shopName,
      this.productName,
      this.productPrice,
      this.productCategory,
      this.productImage,
      this.userName});

  static CartModel fromJson(Map<String, dynamic> map) {
    CartModel cartModel = CartModel(
        shopName: map['shopName'],
        productName: map['productName'],
        productPrice: map['productPrice'],
        productCategory: map['productCategory'],
        productImage: map['productImage'],
        userName: map['userName']);

    return cartModel;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'shopName': shopName,
      'productName': productName,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productImage': productImage,
      'userName': userName
    };
    return json;
  }
}
