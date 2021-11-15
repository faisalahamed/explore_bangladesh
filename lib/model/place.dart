class Place {
  late final String placename;
  late final String image;
  late final String district;
  late final String address;
  late final String type;
  late final String? phone;
  late final bool status;

  Place(
      {required this.placename,
      required this.image,
      required this.district,
      required this.address,
      required this.type,
      this.phone,
      this.status = false});

  Place.fromJson(Map<String, dynamic> json) {
    placename = json['placename'];
    image = json['image'];
    district = json['district'];
    address = json['address'];
    type = json['type'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['placename'] = placename;
    _data['image'] = image;
    _data['district'] = district;
    _data['address'] = address;
    _data['type'] = type;
    _data['phone'] = phone;
    return _data;
  }
}
