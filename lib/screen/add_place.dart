import 'package:explore_bangladesh/db/place_db.dart';
import 'package:explore_bangladesh/model/place.dart';
import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            child: const CircleAvatar(
              radius: 100,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addPlacetoDb,
      ),
    );
  }

  void addPlacetoDb() {
    var place = Place(
      placename: 'place.placename',
      image: ' place.image',
      district: 'place.district',
      address: 'place.address',
      type: 'place.type',
      phone: 'place.phone',
    );
    PlaceDb addPlace = PlaceDb(place: place);
    addPlace.addPlaceDb();
    // AddPlace.getUsers();
  }
}
