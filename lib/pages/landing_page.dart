import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bank_sathi/utils/constants.dart';
import 'package:bank_sathi/utils/layout.dart';
import 'package:bank_sathi/widgets/balance_card.dart';
import 'package:bank_sathi/widgets/dashboard_card.dart';
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

  @override
  void initState() {
    super.initState();
    // todo: read index from shared preferences
  }

  List<Map<String, Widget>> navigationBar = [
    {'Dashboard': const Icon(Icons.dashboard)},
    {'Leads': const Icon(Icons.person)},
    {'Crypto': const Icon(FontAwesomeIcons.coins)},
    {'Medical Test': const Icon(FontAwesomeIcons.fileMedical)},
  ];
  List<Map<String, Widget>> floatingButton = [
    {'Watch and Earn': const Icon(FontAwesomeIcons.youtube)},
    {'Car Rent': const Icon(FontAwesomeIcons.car)},
    {'Trading': const Icon(FontAwesomeIcons.tradeFederation)},
    {'Gadgets': const Icon(FontAwesomeIcons.screwdriverWrench)},
    {'Deposit/ Withdrawal': const Icon(Icons.attach_money_outlined)},
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
                        title: Text(
                          e.keys.first,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppLayout.getHeight(14),
                          ),
                        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BalanceCard(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sell & Earn',
                style: TextStyle(
                  fontSize: AppLayout.getHeight(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              SizedBox(
                height: AppLayout.getHeight(100),
                width: double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: dashboardItems.sublist(0, 5).map((e) {
                    return DashboardCard(
                      item: e,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: AppLayout.getHeight(100),
                width: double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: dashboardItems.sublist(5).map((e) {
                    return DashboardCard(
                      item: e,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // sell and earn
            ],
          ),
        ),
      ),
    );
  }
}
