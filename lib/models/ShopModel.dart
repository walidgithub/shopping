class ShopModel {
  String? shopName, productName, productPrice, productCategory, productImage;

  ShopModel(
      {this.shopName,
      this.productName,
      this.productPrice,
      this.productCategory,
      this.productImage});

  static ShopModel fromJson(Map<String, dynamic> map) {
    ShopModel shopModel = ShopModel(
        shopName: map['shopName'],
        productName: map['productName'],
        productPrice: map['productPrice'],
        productCategory: map['productCategory'],
        productImage: map['productImage']);

    return shopModel;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'shopName': shopName,
      'productName': productName,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productImage': productImage
    };
    return json;
  }
}
