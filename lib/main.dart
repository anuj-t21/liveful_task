import 'package:flutter/material.dart';
import 'package:liveful_task/core/theme/theme.dart';
import 'package:liveful_task/core/utils/screen_util/screen_util.dart';
import 'package:liveful_task/features/weather/presentation/weather_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initializing ScreenUtil to adapt screen and font sizes.
    return ScreenUtilInit(
      minTextAdapt: false, // Disables minimum text adaptation.
      splitScreenMode: false, // Disables split screen mode.
      ensureScreenSize: true, // Ensures that screen size is initialized.
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Liveful Task',
          theme: AppTheme.darkThemeMode,
          home: const WeatherHomePage(),
        );
      },
    );
  }
}
