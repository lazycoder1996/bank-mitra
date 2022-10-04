import 'package:bank_sathi/utils/layout.dart';
import 'package:flutter/material.dart';

import '../utils/helpers.dart';
import 'button.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.green,
            Colors.black87,
            Colors.green,
          ],
        ),
        borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppLayout.getHeight(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfilePicture(),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kirankumar',
                  style: whiteText(16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'ADVISOR CODE: 43100841',
                  style: whiteText(13),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: AppLayout.getHeight(30),
                  child: Button(
                    text: 'Share Profile',
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLayout.getHeight(70),
      width: AppLayout.getHeight(80),
      child: Stack(
        children: [
          Container(
            height: AppLayout.getHeight(70),
            width: AppLayout.getHeight(70),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
            child: Icon(
              Icons.person,
              color: Colors.grey,
              size: AppLayout.getHeight(50),
            ),
          ),
          Positioned(
            top: 30,
            left: 50,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
