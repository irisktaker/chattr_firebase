import 'package:flutter/material.dart';

import 'package:chattr/shared/theme.dart';
import 'package:chattr/shared/constants.dart';
import 'package:chattr/shared/size_config.dart';
import 'package:chattr/shared/widgets/auth/custom_button.dart';
import 'package:chattr/shared/widgets/auth/custom_text_field.dart';
import 'package:chattr/shared/widgets/custom_box_blur_container.dart';
import 'package:chattr/views/screens/auth/forgot_password/forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordBloc _bloc = ForgotPasswordBloc();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Forgot password"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: kPrimaryColor,
        ),
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
                    CustomBoxBlurContainer(
                      child: Column(
                        children: [
                          Text(
                            "Forgot Password",
                            style: titleStyle,
                          ),
                          const SizedBox(height: 26),
                          CustomTextField(
                            key: const ValueKey('email'),
                            keyboardType: TextInputType.emailAddress,
                            controller: _bloc.emailController,
                            hintText: "email",
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            onButtonPressed: () {
                              _bloc.forgotPassword(context, setState);
                              _bloc.emailController.clear();
                            },
                            buttonTitle: "Reset Password",
                          ),
                        ],
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
