class Space {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? city;
  String? country;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberofKitchen;
  int? numberofBedrooms;
  int? numberofCupboards;

  Space({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberofKitchen,
    this.numberofBedrooms,
    this.numberofCupboards,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberofBedrooms = json['number_of_bedrooms'];
    numberofCupboards = json['number_of_cupboards'];
    numberofKitchen = json['number_of_kitchens'];
  }
}
