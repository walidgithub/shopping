class ShoesDetailsData {
  String? price;
  String? imagPath;
  String? desc;

  ShoesDetailsData({required this.price, required this.imagPath, required this.desc});
}

List<ShoesDetailsData> shoesdetailsdata = [
  ShoesDetailsData(price: '350 \$', imagPath: 'assets/images/shoes3.png', desc:'ShoesDesc'),
  ShoesDetailsData(price: '450 \$', imagPath: 'assets/images/shoes4.png', desc:'ShoesDesc'),
];
