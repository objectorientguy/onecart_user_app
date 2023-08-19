import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/on_boarding/login_screen.dart';
import 'package:onecart_user_app/Screens/on_boarding/welcome_screen.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
          elevation: kZero,
          backgroundColor: AppColor.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LogInScreen.routeName);
            },
            icon: const Icon(Icons.arrow_back_rounded, color: AppColor.black),
          ),
          title: const Text('Fill your profile',
              style: TextStyle(color: AppColor.black)),
          titleSpacing: 1.0),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    const CircleAvatar(
                      radius: kCircleAvatarRadius2,
                      backgroundColor: AppColor.lightGrey,
                      backgroundImage: /*(_imageFile == null) ? */
                          AssetImage(
                              'assets/defaultImage.png'), /*: FileImage(File(_imageFile.path))*/
                    ),
                    Positioned(
                      bottom: kZero,
                      right: kZero,
                      child: Container(
                        height: kSearchBarRadius,
                        width: kSearchBarRadius,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: xxxTiniestSpacing,
                                color: AppColor.white),
                            color: AppColor.primary),
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            icon: const Icon(Icons.edit_rounded,
                                size: kIconSize, color: AppColor.white),
                            padding: const EdgeInsets.all(xxxTiniestSpacing)),
                      ),
                    )
                  ]),
                  const SizedBox(height: smallerSpacing),
                  SizedBox(
                    width: kTextboxWidth,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Full name',
                        hintStyle: const TextStyle(color: AppColor.grey),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kBorderRadiusSmall),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: xxTinierSpacing),
                  SizedBox(
                    width: kTextboxWidth,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: const TextStyle(color: AppColor.grey),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kBorderRadiusSmall),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: xxTinierSpacing),
                  SizedBox(
                    width: kTextboxWidth,
                    child: TextField(
                      controller: _date,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Date of birth ',
                        hintStyle: const TextStyle(color: AppColor.grey),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1940, 1, 1),
                                  lastDate: DateTime.now());
                              if (pickeddate != null) {
                                setState(() {
                                  _date.text =
                                      pickeddate.toString().split(" ")[0];
                                });
                              }
                            },
                            icon: const Icon(Icons.calendar_month_rounded,
                                color: AppColor.black)),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kBorderRadiusSmall),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ), //date of birth
                  const SizedBox(height: xxTinierSpacing),
                  SizedBox(
                    width: kTextboxWidth,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email address',
                        hintStyle: const TextStyle(color: AppColor.grey),
                        suffixIcon: const Icon(
                          Icons.email_rounded,
                          color: AppColor.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kBorderRadiusSmall),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: xxTinierSpacing),
                  SizedBox(
                    width: kTextboxWidth,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: const TextStyle(color: AppColor.grey),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kBorderRadiusSmall),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ), //phone number
                  const SizedBox(height: xxTinierSpacing),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size(double.maxFinite, kElevatedButtonHeight),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kGeneralBorderRadius))),
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.textButtonLarger,
                    ),
                  ), //continue
                ])),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: kTextboxHeightSmall,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
          horizontal: xxxSmallestSpacing, vertical: xxxSmallestSpacing),
      child: Column(
        children: [
          const Text('Choose Profile photo'),
          const SizedBox(
            height: xxxSmallestSpacing,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    //takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt_rounded)),
              const Text('Camera'),
              IconButton(
                  onPressed: () {
                    //takePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image_rounded)),
              const Text('Gallery'),
            ],
          ),
        ],
      ),
    );
  }
/*void takePhoto(ImageSource source) async{
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }*/
}
