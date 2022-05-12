import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/screens/auth/auth_bloc.dart';
import 'package:chattr/views/screens/auth/auth_screen.dart';
import 'package:chattr/views/screens/auth/components/setup_screen.dart';
import 'package:flutter/material.dart';

class PasswordSection extends StatelessWidget {
  final _bloc = AuthBloc();

  PasswordSection({Key? key}) : super(key: key);
  static const routeScreen = 'password_section';

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
            controller: _bloc.passwordController,
            onButtonPressed: () {
              if (_bloc.passwordController.text.isNotEmpty) {
                Navigator.pushNamed(context, SetupProfileSection.routeScreen);
              } else {
                final snackBar = SnackBar(
                  content: Text(_bloc.kPassNullError),
                  action: SnackBarAction(
                    label: 'X',
                    textColor: Colors.white,
                    onPressed: () {},
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
              "Password",
              style: titleStyle,
            ),
            buttonTitle: "Next",
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
