class ProductModel {
  String? shopName, productName, productPrice, productCategory, productImage;

  ProductModel(
      {this.shopName,
      this.productName,
      this.productPrice,
      this.productCategory,
      this.productImage});

  static ProductModel fromJson(Map<String, dynamic> map) {
    ProductModel productModel = ProductModel(
        shopName: map['shopName'],
        productName: map['productName'],
        productPrice: map['productPrice'],
        productCategory: map['productCategory'],
        productImage: map['productImage']);

    return productModel;
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
