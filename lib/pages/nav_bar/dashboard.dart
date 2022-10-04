import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/layout.dart';
import '../../widgets/balance_card.dart';
import '../../widgets/dashboard_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
