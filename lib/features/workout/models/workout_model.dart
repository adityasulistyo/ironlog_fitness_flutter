import 'package:flutter/material.dart';
import 'exercise_model.dart'; // Import model exercise

class Workout {
  final String title;
  final String description;
  final String duration;
  final int exerciseCount;
  final IconData icon;
  final List<Exercise> exercises; // TAMBAHAN: Daftar gerakan

  Workout({
    required this.title,
    required this.description,
    required this.duration,
    required this.exerciseCount,
    required this.icon,
    required this.exercises, // Wajib diisi
  });

  // Dummy Data yang sudah di-update dengan Exercise
  static List<Workout> dummyWorkouts = [
    Workout(
      title: 'Upper Body Power',
      description: 'Chest, Shoulders & Triceps focus.',
      duration: '45 min',
      exerciseCount: 3,
      icon: Icons.fitness_center,
      exercises: [
        Exercise(name: 'Bench Press', sets: '4', reps: '8-10', weight: '60kg'),
        Exercise(name: 'Overhead Press', sets: '3', reps: '12', weight: '40kg'),
        Exercise(name: 'Tricep Dips', sets: '3', reps: '15'),
      ],
    ),
    Workout(
      title: 'Leg Day Crusher',
      description: 'Squats, Lunges & Calves.',
      duration: '60 min',
      exerciseCount: 2,
      icon: Icons.directions_run,
      exercises: [
        Exercise(name: 'Barbell Squat', sets: '5', reps: '5', weight: '100kg'),
        Exercise(name: 'Walking Lunges', sets: '3', reps: '20 steps'),
      ],
    ),
    Workout(
      title: 'Full Body HIIT',
      description: 'High intensity cardio burn.',
      duration: '30 min',
      exerciseCount: 4,
      icon: Icons.bolt,
      exercises: [
        Exercise(name: 'Burpees', sets: '4', reps: '30 sec'),
        Exercise(name: 'Mountain Climbers', sets: '4', reps: '30 sec'),
        Exercise(name: 'Jump Squats', sets: '4', reps: '30 sec'),
        Exercise(name: 'Plank', sets: '3', reps: '1 min'),
      ],
    ),
  ];
}