import 'package:flutter/material.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/set_scr.dart';
import 'package:flutter_application_1/set_u.dart';
import 'package:flutter_application_1/set_u.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/set_scr.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key, required String username,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  String phoneNumber = "";
  List<Widget> pages = [
    
    const category(),
    const set_scr(),
  ];
  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  Future<void> getPhoneNumber() async {
    phoneNumber = await set_u.getCachedUserPhone();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      Text("User Name"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Phone: $phoneNumber")],
                  )
                ],
              ),
            ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text("Add product"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text("Cart"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                )),
            const Divider(),
            InkWell(
                onTap: () async {
                  set_u.signOutFlow(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign out"),
                ))
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
