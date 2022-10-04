import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bank_sathi/pages/nav_bar/crypto.dart';
import 'package:bank_sathi/pages/nav_bar/dashboard.dart';
import 'package:bank_sathi/pages/nav_bar/lead.dart';
import 'package:bank_sathi/pages/nav_bar/medical_test.dart';
import 'package:bank_sathi/utils/layout.dart';
import 'package:bank_sathi/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    // todo: read index from shared preferences
  }

  List<Map<String, IconData>> navigationBar = [
    {'Dashboard': Icons.dashboard},
    {'Leads': Icons.person},
    {
      'Crypto': FontAwesomeIcons.coins,
    },
    {
      'Medical Test': FontAwesomeIcons.fileMedical,
    },
  ];
  List<Map<String, Widget>> floatingButton = [
    {
      'Watch and Earn': const Icon(
        FontAwesomeIcons.youtube,
        size: 18,
      )
    },
    {
      'Car Rent': const Icon(
        FontAwesomeIcons.car,
        size: 18,
      )
    },
    {
      'Trading': const Icon(
        FontAwesomeIcons.tradeFederation,
        size: 18,
      )
    },
    {
      'Gadgets': const Icon(
        FontAwesomeIcons.screwdriverWrench,
        size: 18,
      )
    },
    {
      'Deposit/ Withdrawal': const Icon(
        Icons.attach_money_outlined,
        size: 18,
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: floatingButton.map((e) {
                    return ListTile(
                      leading: e.values.first,
                      title: Text(
                        e.keys.first,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppLayout.getHeight(14),
                        ),
                      ),
                    );
                  }).toList(),
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
                Icon(
                  navigationBar[index].values.first,
                  color: index == currentIndex ? Colors.teal : null,
                ),
                const SizedBox(
                  height: 3,
                ),
                FittedBox(
                  child: Text(
                    navigationBar[index].keys.first,
                  ),
                ),
              ],
            );
          },
          activeIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              controller.jumpToPage(newIndex);
              currentIndex = newIndex;
            });
          }),
      key: key,
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
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
      body: PageView(
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        controller: controller,
        children: const [
          Dashboard(),
          Leads(),
          Crypto(),
          MedicalTest(),
        ],
      ),
    );
  }
}
