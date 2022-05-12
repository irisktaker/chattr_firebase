// ignore_for_file: must_be_immutable

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/views/bottom_navigation_bar.dart';
import 'package:chattr/views/screens/auth/auth_bloc.dart';
import 'package:chattr/shared/widgets/pic/image_picker.dart';
import 'package:chattr/shared/widgets/auth/custom_button.dart';
import 'package:chattr/shared/widgets/auth/custom_text_field.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/screens/auth/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeScreen = 'register_screen';
  final _bloc = AuthBloc();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    File? _userImageFile;
    void _pickedImage(File pickedImage) {
      _userImageFile = pickedImage;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: getProportionateScreenWidth(SizeConfig.screenWidth),
          height: getProportionateScreenWidth(SizeConfig.screenHeight),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(flex: 2),
                  Text(
                    "Chattr.",
                    style: headerStyle,
                  ),
                  const SizedBox(height: 100),
                  CustomBoxBlurContainer(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 16),
                            MaterialButton(
                              onPressed: () {
                                // TODO:
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.photo_camera_back_outlined,
                                    color: kPrimaryColor,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Edit display image",
                                    style: subtitleStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _bloc.usernameController,
                          hintText: "username",
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _bloc.emailController,
                          hintText: "email",
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _bloc.passwordController,
                          hintText: "password",
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          onButtonPressed: () {
                            if (_bloc.emailController.text.isNotEmpty &&
                                _bloc.passwordController.text.isNotEmpty &&
                                _bloc.usernameController.text.isNotEmpty) {
                              Navigator.pushNamed(
                                context,
                                BottomNavigationBarTabs.routeScreen,
                              );
                            } else {
                              final snackBar = SnackBar(
                                // TODO: fix controller and error messages
                                content: Text(_bloc.kEmailNullError),
                                action: SnackBarAction(
                                  label: 'X',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // TODO:
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          buttonTitle: "Register",
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Already have an account ",
                              style: subTextStyle,
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                context,
                                LoginScreen.routeScreen,
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
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
              Positioned(
                top: getProportionateScreenHeight(
                  SizeConfig.screenHeight * 0.19,
                ),
                left: getProportionateScreenWidth(
                  SizeConfig.screenWidth * 0.333,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                    child: ImagePickerWidget(_pickedImage),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
