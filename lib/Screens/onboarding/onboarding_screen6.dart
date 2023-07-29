import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_color.dart';

class OnboardingScreen6 extends StatefulWidget {
  const OnboardingScreen6({super.key});

  @override
  State<OnboardingScreen6> createState() => _OnboardingScreen6State();
}

class _OnboardingScreen6State extends State<OnboardingScreen6> {
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
          elevation: 0.00,
          backgroundColor: AppColor.white,
          leading: Icon(Icons.arrow_back_rounded, color: AppColor.black),
          title: Text(
            'Fill your profile',
            style: TextStyle(color: AppColor.black),
          ),
          titleSpacing: 1.0),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/defaultImage.png')),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 2.0, color: AppColor.white),
                            color: AppColor.primary),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit_rounded,
                            size: 12,
                            color: AppColor.white,
                          ),
                          padding: EdgeInsets.all(2.0),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ]),
                  SizedBox(height: 30.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      hintStyle: TextStyle(color: AppColor.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: AppColor.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _date,readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Date of birth ',
                      hintStyle: TextStyle(color: AppColor.grey),
                      suffixIcon: IconButton(onPressed: () async{
                        DateTime? pickeddate = await showDatePicker(context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1940,1,1),
                            lastDate: DateTime.now());
                        if(pickeddate != null){
                          setState(() {
                            _date.text= pickeddate.toString().split(" ")[0];
                          });
                        }
                      },
                          icon: Icon(Icons.calendar_month_rounded,color: AppColor.black)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ), //date of birth
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      hintStyle: TextStyle(color: AppColor.grey),
                      suffixIcon: Icon(
                        Icons.email_rounded,
                        color: AppColor.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: AppColor.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ), //phone number
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 330,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColor.lightGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: Text('Continue')),
                  ), //continue
                ]
            )
        ),
      ),
    );
  }
}
