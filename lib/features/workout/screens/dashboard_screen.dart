import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/app_theme.dart';
import '../models/workout_model.dart';
import 'workout_detail_screen.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar Modern
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning,',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.greyColor),
            ),
            const Text(
              'Ready to Sweat?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppTheme.surfaceColor,
              child: Icon(Icons.person, color: AppTheme.primaryColor),
            ),
          ),
        ],
      ),

      // Tombol Tambah Latihan (Floating Action Button)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {// Tampilkan pesan sementara
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Create Routine feature is coming in Phase 2!'),
              backgroundColor: AppTheme.primaryColor,
              duration: Duration(seconds: 1),
            ),
          );},
        backgroundColor: AppTheme.primaryColor,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('New Routine', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),

      // List Workout
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // Search Bar
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search workouts...',
                prefixIcon: Icon(Icons.search, color: AppTheme.greyColor),
              ),
            ),
            
            const SizedBox(height: 24),
            const Text(
              'My Routines',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // List Card
            Expanded(
              child: ListView.builder(
                itemCount: Workout.dummyWorkouts.length,
                itemBuilder: (context, index) {
                  final workout = Workout.dummyWorkouts[index];
                  return _buildWorkoutCard(context,workout);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Terpisah untuk Card agar Code Rapi (Clean Code)
  Widget _buildWorkoutCard(BuildContext context, Workout workout) {
  return GestureDetector( // <--- 1. Buka GestureDetector
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutDetailScreen(workout: workout),
        ),
      );
    },
    child: Container( // <--- 2. Buka Container
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          // Icon Box
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(workout.icon, color: AppTheme.primaryColor, size: 30),
          ),
          const SizedBox(width: 16),

          // Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  workout.description,
                  style: const TextStyle(color: AppTheme.greyColor, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, size: 14, color: AppTheme.primaryColor),
                    const SizedBox(width: 4),
                    Text(workout.duration,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 16),
                    const Icon(FontAwesomeIcons.dumbbell,
                        size: 12, color: AppTheme.primaryColor),
                    const SizedBox(width: 4),
                    Text('${workout.exerciseCount} Exercises',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),

          // Arrow Icon
          const Icon(Icons.chevron_right, color: AppTheme.greyColor),
        ],
      ), // Tutup Row
    ), // Tutup Container (JANGAN PAKAI TITIK KOMA DI SINI)
  ); // <--- Tutup GestureDetector (BARU PAKAI TITIK KOMA)
}
}