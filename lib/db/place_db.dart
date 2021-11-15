import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_bangladesh/model/place.dart';

class PlaceDb {
  Place place;
  PlaceDb({required this.place});

  CollectionReference places = FirebaseFirestore.instance.collection('places');

  Future<void> addPlaceDb() {
    // Call the user's CollectionReference to add a new user
    return places
        .add({
          'placename': place.placename,
          'image': place.image,
          'district': place.district,
          'address': place.address,
          'type': place.type,
          'phone': place.phone,
          'status': place.status,
        })
        .then((value) => print("place Added"))
        .catchError((error) => print("Failed to add Place:"));
  }

   Future getUsers() async {
    await places.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        print(doc.data());
      });
    });
  }
}
