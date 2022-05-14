// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/views/bottom_navigation_bar.dart';
import 'package:chattr/views/screens/auth/auth_bloc.dart';
import 'package:chattr/shared/widgets/pic/image_picker.dart';
import 'package:chattr/shared/widgets/auth/custom_button.dart';
import 'package:chattr/views/screens/auth/login/login_screen.dart';
import 'package:chattr/shared/widgets/auth/custom_text_field.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';

class RegisterScreen extends StatefulWidget {
  static const routeScreen = 'register_screen';

  RegisterScreen(this.submitFun, {Key? key}) : super(key: key);

  final void Function(
    String email,
    String password,
    String username,
    // File image,
    bool isLogin,
    BuildContext context,
  ) submitFun;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _bloc = AuthBloc();

  void submit(BuildContext context) {
    final _isValid = _bloc.formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_isValid) {
      _bloc.formKey.currentState!.save();

      widget.submitFun(
        _bloc.email.trim(),
        _bloc.username.trim(),
        _bloc.password.trim(),
        _bloc.isLogin,
        context,
      );
    }
  }

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Form(
                key: _bloc.formKey,
                child: Column(
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
                          CustomTextFormField(
                            key: const ValueKey('username'),
                            validator: (val) {
                              if (val!.isEmpty || val.length < 4) {
                                return "Please enter at least 4 characters";
                              }
                              return null;
                            },
                            onSaved: (val) => _bloc.username = val!,
                            controller: _bloc.usernameController,
                            keyboardType: TextInputType.text,
                            hintText: "username",
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            key: const ValueKey('email'),
                            validator: (val) {
                              if (val!.isEmpty || !val.contains('@')) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            onSaved: (val) => _bloc.email = val!,
                            controller: _bloc.emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "email",
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            key: const ValueKey('password'),
                            validator: (val) {
                              if (val!.isEmpty || val.length < 7) {
                                return "Please enter at least 7 characters";
                              }
                              return null;
                            },
                            obscureText: true,
                            onSaved: (val) => _bloc.password = val!,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _bloc.passwordController,
                            hintText: "password",
                          ),
                          const SizedBox(height: 16),
                          _bloc.isLoading
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  onButtonPressed: () {
                                    submit(context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const BottomNavigationBarTabs()));
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
                                        builder: (context) => LoginScreen())),
                                //  Navigator.pushNamed(
                                //   context,
                                //   LoginScreen.routeScreen,
                                // ),
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
                    child: ImagePickerWidget(_bloc.pickedImage),
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
