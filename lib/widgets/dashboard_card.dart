import 'package:bank_sathi/models/dashboard_item.dart';
import 'package:bank_sathi/utils/layout.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final DashboardItem item;

  const DashboardCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      height: AppLayout.getHeight(100),
      child: Card(
        color: item.color ?? Colors.lime[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/${item.imagePath}',
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Earn up to ₹${item.earnTo}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
