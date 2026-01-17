import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/screens/login_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Set ke false jika ingin matikan mode ini nanti
      builder: (context) => const IronLogApp(),
    ),
  );
}

class IronLogApp extends StatelessWidget {
  const IronLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IronLog Fitness',
      debugShowCheckedModeBanner: false,


      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      theme: AppTheme.darkTheme, // Pakai tema gelap kita
      home: const LoginScreen(), // Arahkan ke Login
    );
  }
}