import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              'assets/images/app/dashboard.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/cityview'),
            leading: const Icon(Icons.message),
            title: const Text('Destinations'),
          ),
          const Divider(
            thickness: 0.9,
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/selectcity'),
            leading: const Icon(Icons.add_a_photo),
            title: const Text('Select Destination'),
          ),
          const Divider(
            thickness: 0.9,
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/addplace'),
            leading: const Icon(Icons.add_a_photo),
            title: const Text('Add Place'),
          ),
        ],
      ),
    );
  }
}
