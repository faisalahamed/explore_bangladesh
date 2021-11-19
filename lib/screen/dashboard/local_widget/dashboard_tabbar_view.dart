import 'package:explore_bangladesh/db/place_db.dart';
import 'package:explore_bangladesh/model/place.dart';
import 'package:explore_bangladesh/widgets/item_view.dart';
import 'package:flutter/material.dart';

class DashBoardGridview extends StatelessWidget {
  const DashBoardGridview({Key? key}) : super(key: key);

  Future<List<Place>> getPlace() async {
    List<Place> x = await PlaceDb.getPlacesList();
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return FutureBuilder(
        future: getPlace(),
        // initialData: 0,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
              ),
              itemBuilder: (_, index) => ItemView(
                imageurl: snapshot.data[index].image,
                name: snapshot.data[index].placename,
                star: snapshot.data[index].starcounter,
                review: snapshot.data[index].reviewcounter,
              ),
              itemCount: snapshot.data.length,
            );
          } else {
            return const Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator()));
          }
        },
      );
    });
  }
}
