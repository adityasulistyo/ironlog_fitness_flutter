class Exercise {
  final String name;
  final String sets;
  final String reps;
  final String? weight; // Opsional, default weight

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    this.weight,
  });
}