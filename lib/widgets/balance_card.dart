import 'package:bank_sathi/utils/helpers.dart';
import 'package:bank_sathi/utils/layout.dart';
import 'package:bank_sathi/widgets/button.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout = AppLayout();
    return Card(
      color: Colors.teal,
      // color: '#2C5760'.toColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppLayout.getHeight(10),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.all(AppLayout.getHeight(8)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BALANCE',
                        style: whiteText(16),
                      ),
                      Text(
                        '₹ 0.00',
                        style: whiteText(14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Button(
                    primaryColor: Colors.teal.withOpacity(0.5),
                    text: 'ADD LEAD & EARN',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  (constraints.constrainWidth() / 15).floor(),
                  (index) => const SizedBox(
                    width: 10,
                    height: 2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'TOTAL EARNING',
                    style: whiteText(16),
                  ),
                  const Spacer(),
                  Text(
                    '₹ 0.00',
                    style: whiteText(14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }),
    );
  }
}
