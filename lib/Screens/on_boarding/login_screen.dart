import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/on_boarding/signup_screen.dart';
import 'package:onecart_user_app/blocs/authentication_bloc/authentication_states.dart';
import 'package:onecart_user_app/common_widgets/progress_bar.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/authentication_bloc/authentication_bloc.dart';
import '../../blocs/authentication_bloc/authentication_events.dart';
import '../../configs/app_dimensions.dart';
import '../home/otp.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isHiddenPassword = true;
  bool isSigninScreen = false;
  bool rememberMe = false;
  bool showWrongEmail = false;
  bool showWrongPassword = false;
  String phoneNumber = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: leftRightMargin, vertical: xxxLargerSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: xxxSmallestSpacing),
              (isSigninScreen)
                  ? Text('Login to your account',
                      style: Theme.of(context).textTheme.headingLarger)
                  : Text('Create your account',
                      style: Theme.of(context).textTheme.headingLarger),
              const SizedBox(height: xxxSmallestSpacing),
              Visibility(
                visible: showWrongEmail,
                child: Container(
                    width: kTextboxWidth,
                    height: kTextboxHeightSmall,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(xxTinierSpacing),
                        color: AppColor.lightRed),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Email address is incorrect',
                            style: Theme.of(context).textTheme.smallRed),
                        IconButton(
                            onPressed: () {

                              setState(() {
                                showWrongEmail = false;
                              });
                            },
                            icon: const Icon(
                              Icons.cancel_presentation_rounded,
                              color: AppColor.red,
                            ))
                      ],
                    )),
              ), //wrong email
              Visibility(
                visible: showWrongPassword,
                child: Container(
                    width: kTextboxWidth,
                    height: kTextboxHeightSmall,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(xxTinierSpacing),
                        color: AppColor.lightRed),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('  Password is incorrect',
                            style: Theme.of(context).textTheme.smallRed),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                showWrongPassword = false;
                              });
                            },
                            icon: const Icon(
                              Icons.cancel_presentation_rounded,
                              color: AppColor.red,
                            ))
                      ],
                    )),
              ), //wrong password
              const SizedBox(height: xxxSmallestSpacing),
              SizedBox(
                width: kTextboxWidth,
                child: TextField(
                  onChanged: (value){
                    phoneNumber=value;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: const TextStyle(color: AppColor.grey),
                    prefixIcon:
                        const Icon(Icons.email_rounded, color: AppColor.black),
                    focusColor: AppColor.primary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(xxTinierSpacing),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ), //email
              const SizedBox(height: xxTinierSpacing),
              SizedBox(
                width: kTextboxWidth,
                child: TextField(
                  controller: passwordController,
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: AppColor.grey),
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: AppColor.black,
                    ),
                    suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          isHiddenPassword
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: AppColor.black,
                        )),
                    focusColor: AppColor.primary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(xxTinierSpacing),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ), //password
              const SizedBox(height: tiniestSpacing),
              Visibility(
                visible: isSigninScreen,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Switch(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value;
                            });
                          },
                          activeTrackColor: AppColor.primary,
                          inactiveTrackColor: AppColor.lightGrey),
                      const Text('Remember me'),
                      const SizedBox(width: xxxMediumSpacing),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forget password?'),
                      )
                    ]),
              ),
              const SizedBox(height: tiniestSpacing),
              (isSigninScreen)
                  ? SizedBox(
                      width: kTextboxWidth,
                      child: BlocListener<AuthenticationBloc,AuthenticationStates>(
                        listener: (context,state){
                          if(state is OtpLoading){
                            return  ProgressBar.show(context);
                          }
                          if(state is OtpReceived){
                            ProgressBar.dismiss(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyVerify(verificationIdOne: state.verificationId,)));
                          }
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            if (phoneNumber.length == 10) {
                              context.read<AuthenticationBloc>().add(
                                  GetOtp(phoneNumber: '+91 $phoneNumber'));
                            } else {
                              log("error logging in!");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(
                                  double.maxFinite, kElevatedButtonHeight),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kGeneralBorderRadius))),
                          child: Text(
                            'Sign in',
                            style: Theme.of(context).textTheme.textButtonLarger,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: kTextboxWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(
                                double.maxFinite, kElevatedButtonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    kGeneralBorderRadius))),
                        child: Text(
                          'Sign up',
                          style: Theme.of(context).textTheme.textButtonLarger,
                        ),
                      ),
                    ),
              const SizedBox(height: xxTinierSpacing),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(
                            thickness: 1.0, indent: 40.0, endIndent: 7.0)),
                    Text("Or"),
                    Expanded(
                        child: Divider(
                            thickness: 1.0, indent: 7.0, endIndent: 40.0)),
                  ]), //dividor or
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (isSigninScreen)
                      ? const Text("Don't have an account?")
                      : const Text('Already have an account?'),
                  (isSigninScreen)
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              isSigninScreen = !isSigninScreen;
                            });
                          },
                          child: const Text('Sign up',
                              style: TextStyle(color: AppColor.primary)))
                      : TextButton(
                          onPressed: () {
                            setState(() {
                              isSigninScreen = !isSigninScreen;
                            });
                          },
                          child: const Text('Sign in',
                              style: TextStyle(color: AppColor.primary))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
