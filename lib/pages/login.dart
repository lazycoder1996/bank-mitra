import 'package:bank_sathi/pages/landing_page.dart';
import 'package:bank_sathi/utils/helpers.dart';
import 'package:bank_sathi/utils/layout.dart';
import 'package:bank_sathi/utils/navigation.dart';
import 'package:bank_sathi/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(AppLayout.getHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppLayout.getHeight(10)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        'We will notify you on WhatsApp',
                        style: whiteText(AppLayout.getHeight(15)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(10),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    // todo: navigate to terms and conditions page
                  },
                  child: Text(
                    'By continuing you agree Our Terms and Condition',
                    style: whiteText(AppLayout.getHeight(15)),
                  ),
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(30),
              ),
              Center(
                child: Button(
                  primaryColor: Colors.white,
                  text: 'SEND OTP',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.purple,
                  ),
                  onPressed: () async {
                    // todo: connect firebase and implement OTP
                    // await registerUser('+233${phone.text.trim()}', context);
                    toScreen(context, const LandingPage());
                  },
                ),
              ),
              TextFormField(
                style: whiteText(16),
                cursorColor: Colors.white,
                controller: phone,
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                maxLength: 10,
                onChanged: (st) {
                  if (st.length == 10) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
                decoration: InputDecoration(
                  counterStyle: whiteText(AppLayout.getHeight(16)),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.white,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '+91',
                        style: whiteText(AppLayout.getHeight(16)),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(30),
              ),
              Text(
                'Enter your mobile number\nWe will send you OTP to verify',
                style: const TextStyle(height: 1.5).copyWith(
                    color: Colors.white, fontSize: AppLayout.getHeight(18)),
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              Text(
                'Log in to Continue.',
                style: whiteText(AppLayout.getHeight(20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtpBottomSheet extends StatefulWidget {
  final String phone;
  final String verificationId;

  const OtpBottomSheet({
    Key? key,
    required this.phone,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  TextEditingController otp = TextEditingController();
  bool resendOtp = false;

  String get phone => widget.phone;

  String get verificationId => widget.verificationId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppLayout.getHeight(10)),
            topRight: Radius.circular(AppLayout.getHeight(10)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppLayout.getHeight(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Make Sure It's You.",
                style: TextStyle(
                  fontSize: AppLayout.getHeight(22),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter the 4 digit code sent to your\n mobile number +91 ${phone.replaceRange(2, 8, "******")}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(30),
              ),
              PinFieldAutoFill(
                // decoration: ,
                // currentCode: "****",
                onCodeSubmitted: (val) {},
                codeLength: 6,
                onCodeChanged: (val) {},
                keyboardType: TextInputType.number,
                controller: otp,
              ),
              SizedBox(
                height: AppLayout.getHeight(15),
              ),
              SizedBox(
                height: AppLayout.getHeight(50),
                width: AppLayout.getWidth(100),
                child: Button(
                  style: whiteText(18),
                  text: "It's me!",
                  onPressed: () {
                    // todo: verify OTP
                    FirebaseAuth auth = FirebaseAuth.instance;
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otp.text.trim(),
                    );
                    auth.signInWithCredential(credential).then((user) {
                      toScreen(context, LandingPage(user: user.user!));
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              if (resendOtp)
                InkWell(
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: AppLayout.getHeight(18)),
                  ),
                  onTap: () {
                    // todo: resend OTP
                  },
                ),
              if (!resendOtp)
                TweenAnimationBuilder<Duration>(
                    duration: const Duration(minutes: 1),
                    tween: Tween(
                        begin: const Duration(minutes: 1),
                        end: const Duration(seconds: 1)),
                    onEnd: () {
                      // todo: change inkwell to button
                      print('done');
                      setState(() {
                        resendOtp = true;
                      });
                    },
                    builder:
                        (BuildContext context, Duration value, Widget? child) {
                      final minutes = value.inMinutes;
                      final seconds = value.inSeconds % 60;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Resend OTP ${minutes.toString().padLeft(2, '0')}:'
                          '${seconds.toString().padLeft(2, '0')}',
                          textAlign: TextAlign.center,
                        ),
                      );
                    })
            ],
          ),
        ),
      ),
    );
  }
}
