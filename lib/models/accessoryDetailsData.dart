class AccessoryDetailsData {
  String? price;
  String? imagPath;
  String? desc;

  AccessoryDetailsData({required this.price, required this.imagPath, required this.desc});
}

List<AccessoryDetailsData> accessorydetailsdata = [
  AccessoryDetailsData(price: '50 \$', imagPath: 'assets/images/accessory3.png', desc:'AccessoryDesc'),
  AccessoryDetailsData(price: '90 \$', imagPath: 'assets/images/accessory4.png', desc:'AccessoryDesc'),
];
