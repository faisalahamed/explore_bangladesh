import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_bangladesh/model/place.dart';

class PlaceDb {
  Place place;
  PlaceDb({required this.place});

  static CollectionReference places =
      FirebaseFirestore.instance.collection('places');

  Future<void> addPlaceDb() {
    // Call the user's CollectionReference to add a new user
    return places
        .add(place.toJson())
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

  static Future<List<Place>> getPlacesList() async {
    QuerySnapshot needsSnapshot = await places.get();

    // print(needsSnapshot.docs[0].data()); // to debug and see if data is returned

    List<Place> place = [];

    needsSnapshot.docs
        .map(
          (e) => place.add(Place.fromJson(e.data() as Map<String, dynamic>)),
        )
        .toList();
    // print('---------------------------$place');

    return place;
  }
}
