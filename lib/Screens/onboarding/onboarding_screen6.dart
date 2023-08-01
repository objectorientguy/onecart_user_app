import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen5.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:io';
class OnboardingScreen6 extends StatefulWidget {
  const OnboardingScreen6({super.key});
  @override
  State<OnboardingScreen6> createState() => _OnboardingScreen6State();
}
class _OnboardingScreen6State extends State<OnboardingScreen6> {
  final TextEditingController _date = TextEditingController();
  //PickedFile _imageFile;
  //final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.white,
      appBar: AppBar(elevation: 0.00, backgroundColor: AppColor.white,
          leading: IconButton(onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const OnboardingScreen5()));},
            icon: Icon(Icons.arrow_back_rounded, color: AppColor.black),
          ),
          title: Text('Fill your profile', style: TextStyle(color: AppColor.black)),
          titleSpacing: 1.0),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    CircleAvatar(
                        radius: kCircleAvatarRadius2,
                        backgroundColor: AppColor.lightGrey,
                        backgroundImage: /*(_imageFile == null) ? */
                        AssetImage('assets/defaultImage.png'),
                            /*: FileImage(File(_imageFile.path))*/),
                    Positioned(bottom: 0, right: 0,
                      child: Container(height: 30, width: 30,
                        decoration: BoxDecoration(shape: BoxShape.circle,
                            border: Border.all(width: 2.0, color: AppColor.white),
                            color: AppColor.primary),
                        child: IconButton(onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                          );
                        },
                          icon: Icon(Icons.edit_rounded,size: 12,color: AppColor.white),
                          padding: EdgeInsets.all(2.0)),),)]),
                  SizedBox(height: smallerSpacing),
                  SizedBox(width: kTextboxWidth,
                    child: TextField(decoration: InputDecoration(
                        hintText: 'Full name', hintStyle: TextStyle(color: AppColor.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),),),),),
                  SizedBox(height: xxTinierSpacing),
                  SizedBox(width: kTextboxWidth,
                    child: TextField(decoration: InputDecoration(
                        hintText: 'Username', hintStyle: TextStyle(color: AppColor.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),),),),),
                  SizedBox(height: xxTinierSpacing),
                  SizedBox(width: kTextboxWidth,
                    child: TextField(controller: _date, readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Date of birth ',
                        hintStyle: TextStyle(color: AppColor.grey),
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
                            icon: Icon(Icons.calendar_month_rounded,
                                color: AppColor.black)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ), //date of birth
                  SizedBox(height: xxTinierSpacing),
                  SizedBox(width: kTextboxWidth,
                    child: TextField(decoration: InputDecoration(
                        hintText: 'Email address', hintStyle: TextStyle(color: AppColor.grey),
                        suffixIcon: Icon(Icons.email_rounded, color: AppColor.black,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),),),),),
                  SizedBox(height: xxTinierSpacing),
                  SizedBox(width: kTextboxWidth,
                    child: TextField(decoration: InputDecoration(
                        hintText: 'Phone number', hintStyle: TextStyle(color: AppColor.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),),),),), //phone number
                  SizedBox(height: xxTinierSpacing),
                  ElevatedButton(onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                        const Size(double.maxFinite, kElevatedButtonHeight),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kGeneralBorderRadius))),
                    child: Text('Continue',
                      style: Theme.of(context).textTheme.textButtonLarger,),), //continue
                ])),
      ),
    );
  }
  Widget bottomSheet(){
    return Container(
      height: 100, width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Text('Choose Profile photo'),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                //takePhoto(ImageSource.camera);
              }, icon: Icon(Icons.camera_alt_rounded)),
              Text('Camera'),
              IconButton(onPressed: (){
                //takePhoto(ImageSource.gallery);
              }, icon: Icon(Icons.image_rounded)),
              Text('Gallery'),
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
