import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  final String imageurl;
  final String name;
  final int star;
  final int review;
  const ItemView(
      {Key? key,
      required this.imageurl,
      required this.name,
      required this.review,
      required this.star})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 200,
      child: Stack(
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/singleview'),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              height: 250,
              width: 200,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent]),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: '$imageurl',
                  child: Image.network(
                    imageurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 125,
            left: 20,
            child: SizedBox(
              height: 20,
              width: 160,
              child: Text(
                name.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
              top: 140,
              left: 20,
              child: Row(
                children: starGenerator(star),
              )),
          Positioned(
              top: 150,
              left: 20,
              child: Text(
                'Review ($review)',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  List<Widget> starGenerator(int star) {
    List<Icon> starList = [];

    for (int i = 0; i < star; i++) {
      starList.add(
        const Icon(
          Icons.star_rate,
          size: 12,
          color: Colors.white,
        ),
      );
    }

    return starList;
  }
}
