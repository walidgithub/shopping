class JeansDetailsData {
  String? price;
  String? imagPath;
  String? desc;

  JeansDetailsData({required this.price, required this.imagPath, required this.desc});
}

List<JeansDetailsData> jeansdetailsdata = [
  JeansDetailsData(price: '150 \$', imagPath: 'assets/images/jeans2.png', desc:'JeansDesc'),
  JeansDetailsData(price: '250 \$', imagPath: 'assets/images/jeans3.png', desc:'JeansDesc'),
];
