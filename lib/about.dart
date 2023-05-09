import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/settingspage.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('About'),
          titleTextStyle: Theme.of(context).textTheme.headline3,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.close, size: 24.spMin),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 20.sp, left: 30.sp, right: 30.sp, bottom: 20.sp),
          child: Column(
            children: [
              Text(
                'Maritime English - The Language Learning App for Maritime Students',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Maritime English is a language learning app which is designed to help maritime students improve their communication skills, particularly with regard to Standard Marine Communication Phrases (SMCP).',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Maritime English allows for the practice of SMCP phrases and offers a variety of features to support language learning, including audio recordings, and recording and comparison. Additionally, the app includes the ship learning to ensure that users understand the various parts of the ship.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Our vision for Maritime English is to continuously improve the app to better meet the needs of our learners. To help maritime students gain more knowledge about Maritime English, we are planning to expand our offerings by including additional content related to bridge and engine room operations.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
