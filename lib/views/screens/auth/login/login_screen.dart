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

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const routeScreen = 'login_screen';
  final LoginBloc _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    AuthController _authController = AuthController();
    SizeConfig().init(context);

    _userSignIn() {
      _authController.signIn(
        context,
        email: _bloc.emailController.text,
        password: _bloc.passwordController.text,
      );
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
              image: AssetImage("assets/images/bg1.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _bloc.formKey,
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
                      CustomTextFormField(
                        key: const ValueKey('email'),
                        validator: (val) {
                          if (val!.isEmpty || !val.contains('@')) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        onSaved: (val) {},
                        keyboardType: TextInputType.emailAddress,
                        controller: _bloc.emailController,
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
                        onSaved: (val) {},
                        keyboardType: TextInputType.visiblePassword,
                        controller: _bloc.passwordController,
                        hintText: "password",
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        onButtonPressed: _userSignIn,
                        buttonTitle: "SingIn",
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Don't have an account ",
                            style: subTextStyle,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            ),
                            // Navigator.pushNamed(
                            //   context,
                            //   RegisterScreen.routeScreen,
                            // ),
                            child: const Text(
                              "Register",
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
        ),
      ),
    );
  }
}
