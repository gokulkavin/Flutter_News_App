import 'package:flutter/material.dart';
import 'package:news/Widget/Science.dart';
import 'package:news/Widget/Sports.dart';
import 'package:news/Widget/Technology.dart';
import 'package:news/models/Data_Provider.dart';
import 'package:provider/provider.dart';

var provider = [
  ChangeNotifierProvider<Sport>(create: (_) => Sport("sports")),
  ChangeNotifierProvider<Tech>(create: (_) => Tech("technology")),
  ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider("science")),
];

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiProvider(
      providers: [...provider],
      child: const NavBar(),
    )));

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[800],
        ),
        body: const TabBarView(
          children: [
            Sports(),
            Technology(),
            Science(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.lightBlue[800],
          child: const TabBar(
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                text: 'Sports',
                icon: Icon(Icons.sports_cricket_sharp),
              ),
              Tab(
                text: 'Technology',
                icon: Icon(Icons.laptop_mac),
              ),
              Tab(
                text: 'Science',
                icon: Icon(Icons.science_outlined),
              ),
            ],
          ),
        ),
        // Indexed
      ),
    );
  }
}
