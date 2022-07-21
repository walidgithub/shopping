class ShopFollowerModel {
  String? id, shopName, shopCategory, follower;

  ShopFollowerModel(
      {
        this.id,
        this.shopName,
        this.shopCategory,
        this.follower});

  static ShopFollowerModel fromJson(Map<String, dynamic> map) {
    ShopFollowerModel shopFollowerModel = ShopFollowerModel(
        id: map['id'],
        shopName: map['shopName'],
        shopCategory: map['shopCategory'],
        follower: map['follower']);

    return shopFollowerModel;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'shopName': shopName,
      'shopCategory': shopCategory,
      'follower': follower
    };
    return json;
  }
}
