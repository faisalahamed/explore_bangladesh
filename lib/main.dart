import 'package:explore_bangladesh/screen/add_place/add_place.dart';
import 'package:explore_bangladesh/screen/city_view/city_view.dart';
import 'package:explore_bangladesh/screen/dashboard/dashboard.dart';
import 'package:explore_bangladesh/screen/select_city/select_city.dart';
import 'package:explore_bangladesh/screen/single_place_view/single_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const AddPlace(),
      //  home: const UploadImage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyDashboard(),
        '/addplace': (context) => const AddPlace(),
        '/singleview': (context) => const SingleView(),
        '/cityview': (context) => const CityView(),
        '/selectcity': (context) => const SelectCity(),
      },
    );
  }
}
