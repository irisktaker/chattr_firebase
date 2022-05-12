// ignore_for_file: must_be_immutable

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/shared/widgets/pic/image_picker.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/bottom_navigation_bar.dart';
import 'package:chattr/views/screens/auth/auth_bloc.dart';
import 'package:chattr/views/screens/auth/auth_screen.dart';

class SetupProfileSection extends StatelessWidget {
  static const routeScreen = 'setup_profile_section';
  final _bloc = AuthBloc();

  SetupProfileSection({Key? key}) : super(key: key);
  File? _userImageFile;

  void _pickedImage(File pickedImage) {
    _userImageFile = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
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
                      MaterialButton(
                        onPressed: () {
                          // TODO::
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
                  child: ImagePickerWidget(_pickedImage),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
