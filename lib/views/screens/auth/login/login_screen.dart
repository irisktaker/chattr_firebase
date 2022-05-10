// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chattr/utils/theme.dart';
import 'package:chattr/utils/constants.dart';
import 'package:chattr/utils/size_config.dart';
import 'package:chattr/views/screens/bottom_navigation_bar.dart';
import 'package:chattr/views/widgets/custom_box_blur_container.dart';

import 'login_bloc.dart';

class FormLogin extends StatelessWidget {
  FormLogin({
    Key? key,
    required this.bgImage,
    required this.childWidget,
  }) : super(key: key);

  String bgImage;
  Widget childWidget;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: getProportionateScreenWidth(SizeConfig.screenWidth),
          height: getProportionateScreenWidth(SizeConfig.screenHeight),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: childWidget,
        ),
      ),
    );
  }
}

class EmailSection extends StatelessWidget {
  EmailSection({Key? key}) : super(key: key);
  static const routeScreen = 'email_section';
  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return FormLogin(
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

class PasswordSection extends StatelessWidget {
  PasswordSection({Key? key}) : super(key: key);
  static const routeScreen = 'password_section';
  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return FormLogin(
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

class SetupProfileSection extends StatelessWidget {
  SetupProfileSection({Key? key}) : super(key: key);
  static const routeScreen = 'setup_profile_section';
  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return FormLogin(
      bgImage: 'assets/images/bg2.jpeg',
      childWidget: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(flex: 2),
                Text(
                  "Let's setup\nyour profile",
                  style: headerStyle,
                ),
                const Spacer(flex: 2),
                CustomBoxBlurContainer(
                  controller: _bloc.usernameController,
                  onButtonPressed: () {
                    if (_bloc.usernameController.text.isNotEmpty) {
                      Navigator.pushReplacementNamed(
                        context,
                        BottomNavigationBarTabs.routeScreen,
                      );
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
                  head1: Container(),
                  head2: Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.photo_camera_back_outlined,
                                color: kPrimaryColor,
                              )),
                          Text(
                            "Edit display image",
                            style: subtitleStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  buttonTitle: "All Set!",
                  hintText: "Enter display name",
                ),
                const Spacer(flex: 3),
              ],
            ),
            Positioned(
              top: getProportionateScreenHeight(SizeConfig.screenHeight / 3.1),
              left: getProportionateScreenWidth(SizeConfig.screenWidth / 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white.withOpacity(0.4),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      backgroundImage: const NetworkImage(
                        "https://images.unsplash.com/photo-1594751439417-df8aab2a0c11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
