import 'package:bank_sathi/pages/landing_page.dart';
import 'package:bank_sathi/utils/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/login.dart';

Future registerUser(String mobile, BuildContext context) async {
  print(mobile);
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.verifyPhoneNumber(
    phoneNumber: mobile,
    timeout: const Duration(seconds: 120),
    verificationCompleted: (AuthCredential authCredential) {
      auth.signInWithCredential(authCredential).then((user) {
        toScreen(
            context,
            LandingPage(
              user: user.user!,
            ));
      }).catchError((e) {
        print(e);
      });
    },
    verificationFailed: (FirebaseAuthException authException) {
      print('failed with message ${authException.message}');
    },
    codeSent: (String verificationId, int? resendToken) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return OtpBottomSheet(
              phone: mobile,
              verificationId: verificationId,
            );
          });
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      verificationId = verificationId;
      print(verificationId);
      print('Timeout');
    },
  );
}
