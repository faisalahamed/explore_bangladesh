class Place {
  late final String placename;
  late final String image;
  late final String district;
  late final String address;
  late final String type;
  late final String? phone;
  late final bool status;
  late final int reviewcounter;
  late final int starcounter;
  late final int viewcounter;
  late final bool featured;

  Place(
      {required this.placename,
      required this.image,
      required this.district,
      required this.address,
      required this.type,
      this.phone,
      this.reviewcounter = 0,
      this.viewcounter = 0,
      this.starcounter = 1,
      this.featured = false,
      this.status = false});

  Place.fromJson(Map<String, dynamic> json) {
    placename = json['placename'];
    image = json['image'];
    district = json['district'];
    address = json['address'];
    type = json['type'];
    reviewcounter = json['reviewcounter'];
    viewcounter = json['viewcounter'];
    starcounter = json['starcounter'];
    phone = json['phone'];
    featured = json['featured'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['placename'] = placename;
    _data['image'] = image;
    _data['district'] = district;
    _data['address'] = address;
    _data['type'] = type;
    _data['reviewcounter'] = reviewcounter;
    _data['viewcounter'] = viewcounter;
    _data['starcounter'] = starcounter;
    _data['phone'] = phone;
    _data['featured'] = featured;
    _data['status'] = status;
    return _data;
  }
}
