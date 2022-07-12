class ShirtsDetailsData {
  String? price;
  String? imagPath;
  String? desc;

  ShirtsDetailsData({required this.price, required this.imagPath, required this.desc});
}

List<ShirtsDetailsData> shirtsdetailsdata = [
  ShirtsDetailsData(price: '450 \$', imagPath: 'assets/images/shirt1.png', desc:'ShirtDesc'),
  ShirtsDetailsData(price: '550 \$', imagPath: 'assets/images/shirt3.png', desc:'ShirtDesc'),
];
