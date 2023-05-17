import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/controllers/navigationcontroller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model.dart';

void main() {
  Model model = Model();
  runApp(MyApp(model: model));
}

class MyApp extends StatelessWidget {
  final Model model;

  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData.dark().copyWith(
                appBarTheme: AppBarTheme(color: Color(0xFF253341)),
                scaffoldBackgroundColor: Color(0xFF253341),
                textTheme: GoogleFonts.openSansTextTheme()
                    .apply(
                      bodyColor: Colors.white,
                      displayColor: Colors.white,
                    )
                    .copyWith(
                      headline1: GoogleFonts.openSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      headline2: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      headline3: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      headline4: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(76, 146, 219, 1.0),
                      ),
                      headline5: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      subtitle1: GoogleFonts.openSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      bodyText1: GoogleFonts.openSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      bodyText2: GoogleFonts.openSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(76, 146, 219, 1.0),
                      ),
                    ),
              ),
              themeMode: model.darkMode ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData(
                primarySwatch: const MaterialColor(
                  0xFF4C92DB,
                  <int, Color>{
                    50: Color.fromRGBO(76, 146, 219, 1.0),
                    100: Color.fromRGBO(76, 146, 219, 1.0),
                    200: Color.fromRGBO(76, 146, 219, 1.0),
                    300: Color.fromRGBO(76, 146, 219, 1.0),
                    400: Color.fromRGBO(76, 146, 219, 1.0),
                    500: Color.fromRGBO(76, 146, 219, 1.0),
                    600: Color.fromRGBO(76, 146, 219, 1.0),
                    700: Color.fromRGBO(76, 146, 219, 1.0),
                    800: Color.fromRGBO(76, 146, 219, 1.0),
                    900: Color.fromRGBO(76, 146, 219, 1.0)
                  },
                ),
                textTheme: GoogleFonts.openSansTextTheme()
                    .apply(
                      bodyColor: Colors.black,
                      displayColor: Colors.black,
                    )
                    .copyWith(
                      headline1: GoogleFonts.openSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      headline2: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      headline3: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      headline4: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(76, 146, 219, 1.0),
                      ),
                      headline5: GoogleFonts.openSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      subtitle1: GoogleFonts.openSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      bodyText1: GoogleFonts.openSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      bodyText2: GoogleFonts.openSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(76, 146, 219, 1.0),
                      ),
                    ),
              ),
              home: AnimatedSplashScreen(
                splash: Text('MARITIME ENGLISH',
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold)),
                nextScreen: NavigationController(model: model),
                backgroundColor: Color.fromRGBO(76, 146, 219, 1),
                duration: 4000,
              ),
            );
          },
        );
      },
      designSize: const Size(430, 932),
    );
  }
}