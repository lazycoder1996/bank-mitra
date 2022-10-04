import 'package:bank_sathi/utils/layout.dart';
import 'package:bank_sathi/widgets/button.dart';
import 'package:bank_sathi/widgets/user_account.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: AppLayout.getHeight(50),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppLayout.getHeight(10),
            right: AppLayout.getHeight(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You are Rookie',
                style: TextStyle(
                  fontSize: AppLayout.getHeight(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 35,
                // width: 100,
                child: Button(
                  radius: 10,
                  text: 'UPGRADE NOW',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: UserAccount(),
              ),
              ListViewItem(
                title: 'Dashboard',
                leading: const Icon(Icons.dashboard),
                onTap: () {},
              ),
              ListViewItem(
                title: 'Direct Team',
                leading: const Icon(Icons.group),
                onTap: () {},
              ),
              ListViewItem(
                title: 'Level Team',
                leading: const Icon(Icons.group),
                onTap: () {},
              ),
              // ListViewItem(
              //   title: 'KYC Details',
              //   leading: const Icon(
              //     FontAwesomeIcons.addressCard,
              //     size: 18,
              //   ),
              //   onTap: () {},
              // ),
              ListViewItem(
                title: 'Payment Request',
                leading: const Icon(
                  FontAwesomeIcons.buildingColumns,
                  size: 18,
                ),
                onTap: () {},
              ),
              ListViewItem(
                title: 'Level Income St.',
                leading: const Icon(
                  FontAwesomeIcons.moneyBill,
                  size: 18,
                ),
                onTap: () {},
              ),
              ListViewItem(
                title: 'Lead',
                leading: const Icon(
                  Icons.group,
                ),
                onTap: () {},
              ),
              ListViewItem(
                title: 'Search Lead',
                leading: const Icon(
                  Icons.search,
                ),
                onTap: () {},
              ),
              ListViewItem(
                title: 'Chat with us',
                leading: const Icon(
                  FontAwesomeIcons.whatsapp,
                ),
                onTap: () {},
              ),
              ListViewItem(
                title: 'Telegram',
                leading: const Icon(
                  FontAwesomeIcons.telegram,
                ),
                onTap: () {},
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 20, top: 20),
              //   child: Text('OTHER LINKS'),
              // ),
              // ListViewItem(
              //   title: 'Privacy Policy',
              //   leading: const Icon(
              //     Icons.privacy_tip_outlined,
              //   ),
              //   onTap: () {},
              // ),
              // ListViewItem(
              //   title: 'Rate us',
              //   leading: const Icon(
              //     Icons.rate_review_outlined,
              //   ),
              //   onTap: () {},
              // ),
              // ListViewItem(
              //   title: 'About Bank Mitra',
              //   leading: const Icon(
              //     Icons.info_outlined,
              //   ),
              //   onTap: () {},
              // ),
              // ListViewItem(
              //   title: 'About TDS Deductions',
              //   leading: const Icon(
              //     FontAwesomeIcons.minus,
              //     size: 18,
              //   ),
              //   onTap: () {},
              // ),
              // ListViewItem(
              //   title: 'Delete Account',
              //   leading: const Icon(
              //     Icons.delete_outline,
              //     color: Colors.red,
              //   ),
              //   onTap: () {},
              // ),
              ListViewItem(
                title: 'Visit Website',
                leading: const Icon(
                  Icons.web_outlined,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListViewItem extends StatelessWidget {
  final Widget leading;
  final void Function() onTap;

  final String title;
  final Widget? trailing;

  const ListViewItem({
    Key? key,
    required this.title,
    required this.leading,
    required this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
      ),
      leading: leading,
      trailing: trailing,
    );
  }
}
