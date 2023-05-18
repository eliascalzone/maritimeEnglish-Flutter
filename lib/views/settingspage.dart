import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/model.dart';

class Settings extends StatelessWidget {
  final Model model;
  final void Function() launchUrl;
  final void Function(BuildContext) goToAbout;
  final void Function(bool) enableDarkMode;
  final void Function(BuildContext) reloadApp;

  const Settings(
      {super.key,
      required this.model,
      required this.launchUrl,
      required this.goToAbout,
      required this.enableDarkMode,
      required this.reloadApp});

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
              trailing: Switch(
                  value: model.darkMode,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    enableDarkMode(value);
                    reloadApp(context);
                  }),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.sp,
            ),
            GestureDetector(
              onTap: () {
                goToAbout(context);
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
            /*ListTile(
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
            ),*/
            GestureDetector(
                onTap: () {
                  launchUrl();
                },
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
                    'Read more about SMCP',
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
