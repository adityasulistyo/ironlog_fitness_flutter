import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/screens/login_screen.dart'; // Untuk Logout

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('My Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. PROFILE HEADER
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppTheme.primaryColor,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'), // Dummy Image
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Alex Thunder',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Elite Member',
              style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // 2. USER STATS (Weight, Height, Age)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn('75 kg', 'Weight'),
                  _buildDivider(),
                  _buildStatColumn('180 cm', 'Height'),
                  _buildDivider(),
                  _buildStatColumn('24 yo', 'Age'),
                ],
              ),
            ),
            
            const SizedBox(height: 30),

            // 3. MENU OPTIONS
            _buildMenuTile(context, Icons.person_outline, 'Edit Profile'),
            _buildMenuTile(context, Icons.notifications_outlined, 'Notifications'),
            _buildMenuTile(context, Icons.privacy_tip_outlined, 'Privacy & Security'),
            _buildMenuTile(context, Icons.headset_mic_outlined, 'Help & Support'),
            
            const SizedBox(height: 20),
            
            // 4. LOGOUT BUTTON
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Logout Logic
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppTheme.errorColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: AppTheme.errorColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppTheme.greyColor, fontSize: 12)),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white24,
    );
  }

  Widget _buildMenuTile(BuildContext context, IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.chevron_right, color: AppTheme.greyColor),
        onTap: () {},
      ),
    );
  }
}