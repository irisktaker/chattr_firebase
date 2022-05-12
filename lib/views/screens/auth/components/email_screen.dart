import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/views/screens/auth/auth_bloc.dart';
import 'package:chattr/views/screens/auth/auth_screen.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/screens/auth/components/password_screen.dart';

class EmailSection extends StatelessWidget {
  final _bloc = AuthBloc();

  EmailSection({Key? key}) : super(key: key);
  static const routeScreen = 'email_section';

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      bgImage: 'assets/images/bg1.jpeg',
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(flex: 2),
          Text(
            "Chattr.",
            style: headerStyle,
          ),
          const Spacer(),
          CustomBoxBlurContainer(
            controller: _bloc.emailController,
            onButtonPressed: () {
              if (_bloc.emailController.text.isNotEmpty) {
                Navigator.pushNamed(context, PasswordSection.routeScreen);
              } else {
                final snackBar = SnackBar(
                  content: Text(_bloc.kEmailNullError),
                  action: SnackBarAction(
                    label: 'X',
                    textColor: Colors.white,
                    onPressed: () {
                      // TODO:
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            head1: Text(
              "Enter your",
              style: subtitleStyle,
            ),
            head2: Text(
              "Email Address",
              style: titleStyle,
            ),
            buttonTitle: "Next",
            customWidget: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  "By creating an account you accept our",
                  style: subTextStyle,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
