import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermaritime/homepage.dart';
import 'package:fluttermaritime/settingspage.dart';
import 'package:fluttermaritime/theshipex.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
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
              home: RootPage(),
            );
          },
        );
      },
      designSize: const Size(430, 932),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [Homepage(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MARITIME ENGLISH',
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
