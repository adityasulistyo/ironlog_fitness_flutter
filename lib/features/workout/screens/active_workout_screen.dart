import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../models/workout_model.dart';

class ActiveWorkoutScreen extends StatefulWidget {
  final Workout workout;

  const ActiveWorkoutScreen({super.key, required this.workout});

  @override
  State<ActiveWorkoutScreen> createState() => _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends State<ActiveWorkoutScreen> {
  // Timer Logic
  late Timer _timer;
  int _secondsElapsed = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  String get _formattedTime {
    final int minutes = _secondsElapsed ~/ 60;
    final int seconds = _secondsElapsed % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.surfaceColor,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.pop(context), // Minimize/Close
        ),
        title: Column(
          children: [
            Text(
              widget.workout.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              _formattedTime, // Timer berjalan
              style: const TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w900, 
                color: AppTheme.primaryColor,
                fontFamily: 'monospace'
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Aksi Selesai Latihan
              Navigator.pop(context); // Kembali ke Dashboard
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Workout Finished! Great job! 🔥')),
              );
            },
            child: const Text('FINISH', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: widget.workout.exercises.length,
        itemBuilder: (context, index) {
          final exercise = widget.workout.exercises[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Nama Latihan
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    exercise.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 18, 
                      color: AppTheme.primaryColor
                    ),
                  ),
                ),
                
                // Header Kolom (Set, Previous, kg, Reps, Done)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    children: [
                      SizedBox(width: 30, child: Text('SET', style: TextStyle(fontSize: 12, color: AppTheme.greyColor, fontWeight: FontWeight.bold))),
                      Expanded(child: Center(child: Text('PREVIOUS', style: TextStyle(fontSize: 12, color: AppTheme.greyColor, fontWeight: FontWeight.bold)))),
                      SizedBox(width: 60, child: Center(child: Text('KG', style: TextStyle(fontSize: 12, color: AppTheme.greyColor, fontWeight: FontWeight.bold)))),
                      SizedBox(width: 60, child: Center(child: Text('REPS', style: TextStyle(fontSize: 12, color: AppTheme.greyColor, fontWeight: FontWeight.bold)))),
                      SizedBox(width: 40, child: Icon(Icons.check, size: 16, color: AppTheme.greyColor)),
                    ],
                  ),
                ),

                // List Sets (Kita hardcode 3 set dulu sebagai contoh UI)
                _buildSetRow(1, '20kg x 12'),
                _buildSetRow(2, '20kg x 12'),
                _buildSetRow(3, '20kg x 10'),
                
                // Tombol Add Set
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                  ),
                  child: const Center(
                    child: Text('+ Add Set', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.greyColor)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget Baris Set Latihan
  Widget _buildSetRow(int setNum, String prevData) {
    bool isChecked = false; // State lokal sederhana

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: isChecked ? Colors.green.withOpacity(0.1) : Colors.transparent,
          child: Row(
            children: [
              // Nomor Set
              SizedBox(
                width: 30,
                child: Container(
                  width: 24, height: 24,
                  decoration: BoxDecoration(color: AppTheme.backgroundColor, borderRadius: BorderRadius.circular(4)),
                  child: Center(child: Text('$setNum', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
                ),
              ),
              
              // Data Sebelumnya
              Expanded(child: Center(child: Text(prevData, style: const TextStyle(color: AppTheme.greyColor, fontSize: 12)))),
              
              // Input KG
              SizedBox(
                width: 60,
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(color: AppTheme.backgroundColor, borderRadius: BorderRadius.circular(4)),
                  child: const Center(child: Text('0', style: TextStyle(fontWeight: FontWeight.bold))),
                ),
              ),
              const SizedBox(width: 8),

              // Input Reps
              SizedBox(
                width: 60,
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(color: AppTheme.backgroundColor, borderRadius: BorderRadius.circular(4)),
                  child: const Center(child: Text('0', style: TextStyle(fontWeight: FontWeight.bold))),
                ),
              ),
              const SizedBox(width: 12),

              // Checkbox Custom
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Container(
                  width: 28, height: 28,
                  decoration: BoxDecoration(
                    color: isChecked ? Colors.green : AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isChecked ? const Icon(Icons.check, size: 18, color: Colors.white) : null,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}