import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/models/app_context.dart';
import 'package:esgrow/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

void main() {
  configLoading();
  AppContext context = AppContext();
  runApp(MyApp(appContext: context));
}

class MyApp extends StatelessWidget {
  AppContext appContext;

  MyApp({super.key, required this.appContext});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        builder: EasyLoading.init(),
        title: 'Esgrow',
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          textTheme: GoogleFonts.interTextTheme()
              .apply(bodyColor: Colors.white, displayColor: Colors.white),
          colorScheme: const ColorScheme.dark(
              primary: primaryColor, primaryContainer: containerColor),
          useMaterial3: true,
        ),
        home:  Homepage(appContext:appContext),
      ),
    );
  }
}
