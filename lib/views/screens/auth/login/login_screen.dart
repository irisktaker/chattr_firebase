// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/controllers/auth_controller.dart';
import 'package:chattr/views/screens/chat/chat_screen.dart';
import 'package:chattr/shared/widgets/auth/custom_button.dart';
import 'package:chattr/views/screens/auth/login/login_bloc.dart';
import 'package:chattr/shared/widgets/auth/custom_text_field.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/screens/auth/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeScreen = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc _bloc = LoginBloc();
  bool _isLoading = false;

  _loginUser() async {
    setState(() => _isLoading = true);

    String res = await AuthController().loginUser(
      _bloc.emailController.text,
      _bloc.passwordController.text,
    );

    setState(() => _isLoading = false);

    if (res == 'success') {
      showSnackBar('Login successfully', context);
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    } else {
      return showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
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
                                _loginUser();
                                _bloc.emailController.clear();
                                _bloc.passwordController.clear();
                              },
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
                                        builder: (context) =>
                                            const RegisterScreen()),
                                  ),
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
