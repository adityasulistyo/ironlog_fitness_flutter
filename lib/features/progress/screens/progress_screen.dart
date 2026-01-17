import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Your Progress', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. STATISTIC CARDS
            Row(
              children: [
                _buildStatCard('Workouts', '12', Icons.check_circle_outline, Colors.green),
                const SizedBox(width: 16),
                _buildStatCard('Minutes', '450', Icons.timer, Colors.orange),
              ],
            ),
            const SizedBox(height: 30),

            // 2. CHART TITLE
            const Text('Activity Level', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // 3. BAR CHART (FL_CHART)
            Container(
              height: 250,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: BarChart(
                BarChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                          if (value.toInt() < days.length) {
                             return Text(days[value.toInt()], style: const TextStyle(color: Colors.grey, fontSize: 12));
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _makeBarGroup(0, 3), // Senin
                    _makeBarGroup(1, 5), // Selasa
                    _makeBarGroup(2, 2), // Rabu
                    _makeBarGroup(3, 0), // Kamis (Rest)
                    _makeBarGroup(4, 4), // Jumat
                    _makeBarGroup(5, 6), // Sabtu (Hard)
                    _makeBarGroup(6, 1), // Minggu
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // 4. RECENT HISTORY
            const Text('Recent History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildHistoryItem('Upper Body Power', 'Yesterday'),
            _buildHistoryItem('Leg Day Crusher', '3 days ago'),
            _buildHistoryItem('Full Body HIIT', '5 days ago'),
          ],
        ),
      ),
    );
  }

  // Helper untuk Grafik
  BarChartGroupData _makeBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y > 0 ? AppTheme.primaryColor : Colors.transparent,
          width: 16,
          borderRadius: BorderRadius.circular(4),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 8, // Max height background
            color: AppTheme.backgroundColor,
          ),
        ),
      ],
    );
  }

  // Helper untuk Kartu Statistik
  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: AppTheme.greyColor, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // Helper untuk List History
  Widget _buildHistoryItem(String title, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Completed', style: TextStyle(color: Colors.green[400], fontSize: 12)),
            ],
          ),
          Text(date, style: const TextStyle(color: AppTheme.greyColor, fontSize: 12)),
        ],
      ),
    );
  }
}