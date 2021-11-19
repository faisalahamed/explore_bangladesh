import 'package:flutter/material.dart';

class DashboardSliverAppbar extends StatelessWidget {
  const DashboardSliverAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor:const Color(0xff7b1fa2),
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent]),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/app/dashboard.jpg'),
                      fit: BoxFit.cover)),
            ),
            const Positioned(
              left: 20,
              top: 150,
              child: Text(
                'Find Your Sweetest \nDedstination',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            // Positioned(
            //   top: 150,
            //   left: 30,
            //   right: 130,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     // width: MediaQuery.of(context).size.width,
            //     height: 50,
            //     child: AspectRatio(
            //       aspectRatio: 0.3,
            //       child: TextField(
            //         // style: TextStyle(decoration: TextDecoration.none),
            //         decoration: InputDecoration(
            //           focusedBorder: InputBorder.none,
            //           border: InputBorder.none,
            //           icon: Icon(Icons.search),
            //           hintText: 'Search District',
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 150,
            //   right: 20,
            //   child: Container(
            //     decoration:
            //         BoxDecoration(borderRadius: BorderRadius.circular(12)),
            //     width: 100,
            //     height: 50,
            //     child: ElevatedButton(

            //       style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(
            //               Color(0xff7b1fa2),)),
            //       onPressed: () {},
            //       child: Text('Search'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
