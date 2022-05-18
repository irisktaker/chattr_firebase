// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/controllers/auth_controller.dart';
import 'package:chattr/shared/widgets/auth/custom_button.dart';
import 'package:chattr/views/screens/auth/login/login_bloc.dart';
import 'package:chattr/shared/widgets/auth/custom_text_field.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/screens/auth/register/register_screen.dart';
import 'package:chattr/views/screens/auth/forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeScreen = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _bloc.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                width: getProportionateScreenWidth(SizeConfig.screenWidth),
                height: getProportionateScreenWidth(SizeConfig.screenHeight),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg1.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      "Chattr.",
                      style: headerStyle,
                    ),
                    const Spacer(),
                    CustomBoxBlurContainer(
                      child: Column(
                        children: [
                          Text(
                            "Sign In",
                            style: subtitleStyle,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Email and Password",
                            style: titleStyle,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            key: const ValueKey('email'),
                            keyboardType: TextInputType.emailAddress,
                            controller: _bloc.emailController,
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
                              _bloc.loginUser(context, setState);
                              _bloc.emailController.clear();
                              _bloc.passwordController.clear();
                            },
                            buttonTitle: "SingIn",
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen()),
                            ),
                            child: const Text(
                              "Forgot password",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ",
                                style: subTextStyle,
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()),
                                ),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
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
                    MaterialButton(
                      onPressed: () {
                        // google sign in
                        AuthController().signInWithGoogle();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        width: getProportionateScreenHeight(
                            SizeConfig.screenWidth / 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/google.png",
                              width: 26,
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              "Sign in with Google",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
      ),
    );
  }
}
