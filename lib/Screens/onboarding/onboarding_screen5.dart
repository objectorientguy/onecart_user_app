import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen4.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen6.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen7.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
class OnboardingScreen5 extends StatefulWidget {
  const OnboardingScreen5({super.key});
  @override
  State<OnboardingScreen5> createState() => _OnboardingScreen5State();
}
class _OnboardingScreen5State extends State<OnboardingScreen5> {
  bool isHiddenPassword = true;
  bool isSigninScreen = false;bool rememberMe = false;
  bool showWrongEmail = false;bool showWrongPassword = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0.00,
        backgroundColor: AppColor.white,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const OnboardingScreen4()));},
          icon: Icon(Icons.arrow_back_rounded, color: AppColor.black),),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: xxxSmallestSpacing),
              (isSigninScreen) ? Text('Login to your account',
                      style: Theme.of(context).textTheme.headingLarger) : Text('Create your account',
                      style: Theme.of(context).textTheme.headingLarger),
              SizedBox(height: xxxSmallestSpacing),
              Visibility(visible: showWrongEmail,
                child: Container(width: 320, height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.lightRed),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('  Email address is incorrect',
                            style: Theme.of(context).textTheme.smallRed),
                        IconButton(onPressed: () {
                              setState(() {showWrongEmail = false;});},
                            icon: Icon(Icons.cancel_presentation_rounded,
                              color: AppColor.red,))
                      ],)),), //wrong email
              Visibility(visible: showWrongPassword,
                child: Container(width: 320, height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.lightRed),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('  Password is incorrect',
                            style: Theme.of(context).textTheme.smallRed),
                        IconButton(onPressed: () {
                              setState(() {showWrongPassword = false;});},
                            icon: Icon(Icons.cancel_presentation_rounded,
                              color: AppColor.red,))
                      ],)),), //wrong password
              SizedBox(height: xxxSmallestSpacing),
              SizedBox(width: kTextboxWidth,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: TextStyle(color: AppColor.grey),
                    prefixIcon: Icon(Icons.email_rounded, color: AppColor.black),
                    focusColor: AppColor.primary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ), //email
              SizedBox(height: xxTinierSpacing),
              SizedBox(width: kTextboxWidth,
                child: TextField(
                  controller: passwordController, obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    hintText: 'Password', hintStyle: TextStyle(color: AppColor.grey),
                    prefixIcon: Icon(Icons.lock_rounded, color: AppColor.black,),
                    suffixIcon: InkWell(onTap: _togglePasswordView,
                        child: Icon(isHiddenPassword
                              ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                          color: AppColor.black,)),
                    focusColor: AppColor.primary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),),),),), //password
              SizedBox(height: tiniestSpacing),
              Visibility(visible: isSigninScreen,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Switch(value: rememberMe, onChanged: (value) {
                            setState(() {rememberMe = value;});},
                          activeTrackColor: AppColor.primary,
                          inactiveTrackColor: AppColor.lightGrey),
                      Text('Remember me'),
                      SizedBox(width: xxxMediumSpacing),
                      TextButton(onPressed: () {},child: Text('Forget password?'),)
                    ]),),
              SizedBox(height: tiniestSpacing),
              (isSigninScreen)
                  ? SizedBox(width: kTextboxWidth,
                      child: ElevatedButton(
                          onPressed: () {if (emailController.text == 'johndoe@gmail.com') {
                              if (passwordController.text == '12345678') {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => const OnboardingScreen7()));
                              } else {setState(() {showWrongPassword = true;});}}
                           else {setState(() {showWrongEmail = true;});}},
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                            const Size(double.maxFinite, kElevatedButtonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(kGeneralBorderRadius))),
                        child: Text('Sign in',
                          style: Theme.of(context).textTheme.textButtonLarger,
                        ),),) : SizedBox(
                      width: kTextboxWidth,
                      child: ElevatedButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) => const OnboardingScreen6()));},
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                            const Size(double.maxFinite, kElevatedButtonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(kGeneralBorderRadius))),
                        child: Text('Sign up',
                          style: Theme.of(context).textTheme.textButtonLarger,
                        ),),),
              SizedBox(height: xxTinierSpacing),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(thickness: 1.0, indent: 40.0, endIndent: 7.0)),
                    Text("Or"),
                    Expanded(child: Divider(thickness: 1.0, indent: 7.0, endIndent: 40.0)),
                  ]), //dividor or
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (isSigninScreen)
                      ? Text("D'ont have an account?") : Text('Already have an account?'),
                  (isSigninScreen)
                      ? TextButton(
                          onPressed: () {setState(() {isSigninScreen = !isSigninScreen;});},
                          child: Text('Sign up',
                              style: TextStyle(color: AppColor.primary))) : TextButton(
                          onPressed: () {setState(() {isSigninScreen = !isSigninScreen;});},
                          child: Text('Sign in',
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
    setState(() {isHiddenPassword = !isHiddenPassword;});
  }
}
