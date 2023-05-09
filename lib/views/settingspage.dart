import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/about.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  _launchURL() async {
    const url =
        'https://www.imo.org/en/OurWork/Safety/Pages/StandardMarineCommunicationPhrases.aspx';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        titleTextStyle: Theme.of(context).textTheme.headline3,
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(245, 247, 250, 1.0),
      body: Padding(
        padding: EdgeInsets.only(left: 20.sp, top: 20.sp, right: 20.sp),
        child: ListView(
          children: [
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(4.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black87),
                child: Icon(
                  Icons.dark_mode_rounded,
                  color: Colors.white,
                  size: 25.sp,
                ),
              ),
              title: Text(
                'Dark mode',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24.sp,
                color: Color.fromRGBO(251, 127, 46, 1),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.sp,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const About()));
              },
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(251, 127, 46, 1)),
                  child: Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                ),
                title: Text(
                  'About ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 24.sp,
                  color: Color.fromRGBO(251, 127, 46, 1),
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.sp,
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(4.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green),
                child: Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 25.sp,
                ),
              ),
              title: Text(
                'Share Maritime English',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24.sp,
                color: Color.fromRGBO(251, 127, 46, 1),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.sp,
            ),
            GestureDetector(
                onTap: _launchURL,
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(76, 146, 219, 1)),
                    child: Icon(
                      Icons.read_more_rounded,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Read more SMCP',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 24.sp,
                    color: Color.fromRGBO(251, 127, 46, 1),
                  ),
                )),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.sp,
            ),
          ],
        ),
      ),
    );
  }
}
