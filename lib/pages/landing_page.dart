import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bank_sathi/utils/layout.dart';
import 'package:bank_sathi/widgets/balance_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final User? user;

  const LandingPage({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // todo: read index from shared preferences
  }

  List<Map<String, Widget>> navigationBar = [
    {'Job Posting': Icon(Icons.home)},
    {'Buy and Sell': Icon(Icons.home)},
    {'Crypto': Icon(Icons.home)},
    {'Medical Test': Icon(Icons.home)},
  ];
  List<Map<String, Widget>> floatingButton = [
    {'Watch and Earn': Icon(Icons.home)},
    {'Car Rent': Icon(Icons.home)},
    {'Trading': Icon(Icons.home)},
    {'Gadgets': Icon(Icons.home)},
    {'Deposit/ Withdrawal': Icon(Icons.home)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              // constraints: BoxConstraints(maxHeight: AppLayout.getHeight(100)),
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppLayout.getHeight(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: floatingButton.map((e) {
                      return ListTile(
                        leading: e.values.first,
                        title: Text(e.keys.first),
                      );
                    }).toList(),
                  ),
                );
              });
        },
        child: const Icon(
          Icons.add,
        ),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          itemCount: navigationBar.length,
          tabBuilder: (index, val) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                navigationBar[index].values.first,
                Text(
                  navigationBar[index].keys.first,
                ),
              ],
            );
          },
          activeIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          }),
      key: key,
      drawer: const Drawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            key.currentState!.openDrawer();
          },
        ),
        title: RichText(
          text: const TextSpan(children: [
            TextSpan(text: 'Hi'),
            TextSpan(text: ' '),
            TextSpan(
              text: 'Kirankumar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: BalanceCard(),
            ),
          ],
        ),
      ),
    );
  }
}
