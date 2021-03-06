// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/controllers/auth_controller.dart';
import 'package:chattr/views/screens/chat/chat_screen.dart';
import 'package:chattr/shared/widgets/pic/image_picker.dart';
import 'package:chattr/shared/widgets/auth/custom_button.dart';
import 'package:chattr/views/screens/auth/login/login_screen.dart';
import 'package:chattr/shared/widgets/auth/custom_text_field.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/screens/auth/register/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const routeScreen = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterBloc _bloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _bloc.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
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
                                    onPressed: () => _bloc.showAlertDialog(
                                        context, setState),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                key: const ValueKey('username'),
                                controller: _bloc.usernameController,
                                keyboardType: TextInputType.text,
                                hintText: "username",
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                key: const ValueKey('email'),
                                controller: _bloc.emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "email",
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                key: const ValueKey('password'),
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: _bloc.passwordController,
                                hintText: "password",
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
                                onButtonPressed: () {
                                  _bloc.signUpUser(context, setState);
                                  _bloc.usernameController.clear();
                                  _bloc.emailController.clear();
                                  _bloc.passwordController.clear();
                                  // _bloc.image!.clear();
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
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen())),
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
                          child: ImagePickerWidget(
                            image: _bloc.image,
                          ),
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
