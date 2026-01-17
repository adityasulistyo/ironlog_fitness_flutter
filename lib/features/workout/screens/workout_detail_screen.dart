import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/app_theme.dart';
import '../models/workout_model.dart';
import 'active_workout_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. HEADER (App Bar Besar)
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                workout.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Ukuran kecil saat discroll
                ),
              ),
              background: Container(
                color: AppTheme.surfaceColor,
                child: Center(
                  child: Icon(
                    workout.icon,
                    size: 80,
                    color: AppTheme.primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),

          // 2. DESKRIPSI & INFO
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.description,
                    style: const TextStyle(color: AppTheme.greyColor, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoBadge(Icons.timer, workout.duration),
                      _buildInfoBadge(FontAwesomeIcons.dumbbell, '${workout.exercises.length} Exercises'),
                      _buildInfoBadge(Icons.local_fire_department, 'Burn 300+ kcal'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Exercises',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // 3. LIST LATIHAN (Exercises)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final exercise = workout.exercises[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Nomor Urut
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      // Detail Gerakan
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${exercise.sets} Sets x ${exercise.reps} Reps ${exercise.weight != null ? '@ ${exercise.weight}' : ''}',
                              style: const TextStyle(color: AppTheme.greyColor, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      
                      const Icon(Icons.info_outline, color: AppTheme.greyColor, size: 20),
                    ],
                  ),
                );
              },
              childCount: workout.exercises.length,
            ),
          ),
          
          // Spacer bawah agar tombol Start tidak menutupi list terakhir
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      
      // TOMBOL MULAI (Floating di bawah)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke Active Workout
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActiveWorkoutScreen(workout: workout),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          child: const Text('START WORKOUT'),
        ),
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppTheme.primaryColor),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}