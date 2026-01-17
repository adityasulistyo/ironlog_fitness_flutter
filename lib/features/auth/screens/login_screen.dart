import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../home/screens/main_navigation_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Agar tidak error saat keyboard muncul
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              // LOGO AREA
              const Center(
                child: Icon(FontAwesomeIcons.dumbbell, size: 80, color: AppTheme.primaryColor),
              ),
              const SizedBox(height: 24),
              Text(
                'IRONLOG',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900, 
                  letterSpacing: 2,
                  color: AppTheme.whiteColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Track. Progress. Conquer.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.greyColor),
              ),
              
              const SizedBox(height: 48),

              // FORM INPUT
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Email Address',
                  prefixIcon: Icon(Icons.email_outlined, color: AppTheme.greyColor),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline, color: AppTheme.greyColor),
                ),
              ),
              
              // FORGOT PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?', style: TextStyle(color: AppTheme.greyColor)),
                ),
              ),
              
              const SizedBox(height: 24),

              // LOGIN BUTTON
              ElevatedButton(
                onPressed: () {
                  // Tambahkan Kode Navigasi Ini:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
                  );
                },
                child: const Text('LOGIN'),
              ),

              const SizedBox(height: 24),
              const Row(children: [
                Expanded(child: Divider(color: AppTheme.surfaceColor)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('OR', style: TextStyle(color: AppTheme.greyColor))),
                Expanded(child: Divider(color: AppTheme.surfaceColor)),
              ]),
              const SizedBox(height: 24),
              
              // SOCIAL LOGIN
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.google, size: 18, color: Colors.white),
                label: const Text('Continue with Google', style: TextStyle(color: Colors.white)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppTheme.surfaceColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}