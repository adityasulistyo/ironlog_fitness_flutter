# IronLog Fitness App 💪

A modern, high-performance fitness tracking application built with **Flutter**. Designed as a refined clone inspired by popular apps like Hevy and Lyfta, this project focuses on a clean UI/UX, maintainable code structure, and efficient workout tracking logic.

## 📱 Project Overview

**IronLog** allows users to manage their workout routines, track active sessions with real-time timers, and visualize their progress through interactive charts.

This project was built to demonstrate:
- **Clean Architecture** (Feature-first structure)
- **Responsive Mobile UI** (Dark mode with neon accents)
- **Complex State Management** (Timer logic, dynamic lists, chart data)

## ✨ Key Features (Phase 1)

* **🔐 Authentication UI**
    * Modern, dark-themed login screen with validation-ready inputs.
* **🏋️‍♂️ Workout Dashboard**
    * Scrollable list of workout routines.
    * Difficulty indicators and "Quick Start" access.
* **⏱ Active Workout Session**
    * **Real-time Timer:** Persists during the workout.
    * **Set Tracking:** Interactive checkboxes to mark sets as complete.
    * **Input Handling:** Fields for Weight (kg) and Reps.
* **asd📈 Progress Analytics**
    * Weekly activity visualization using `fl_chart`.
    * Summary statistics (Workouts completed, Minutes spent).
* **👤 User Profile**
    * Personal stats display (Weight, Height, Age).
    * Settings menu navigation structure.

## 🛠 Tech Stack & Dependencies

* **Framework:** Flutter (Dart)
* **Architecture:** Feature-First Clean Architecture
* **State Management:** Provider & StatefulWidgets
* **UI Components:**
    * `google_fonts` (Inter font family)
    * `font_awesome_flutter` (Custom icons)
    * `fl_chart` (Data visualization)
* **Tools:** VS Code, Git

## 📂 Project Structure

The codebase follows a scalable **Feature-First** directory structure to ensure maintainability:

```text
lib/
├── core/
│   ├── theme/          # AppTheme (Colors, Typography)
│   └── constants/      # Global assets & strings
├── features/
│   ├── auth/           # Login & Register screens
│   ├── home/           # Main navigation wrapper
│   ├── workout/        # Dashboard, Detail, & Active Session logic
│   ├── progress/       # Charts & Statistics
│   └── profile/        # User settings & data
└── main.dart           # App entry point

```

## 🚀 Getting Started

To run this project locally:

1. **Clone the repository**
```bash
git clone [https://github.com/adityasulistyo/ironlog_fitness_flutter.git](https://github.com/YOUR_USERNAME/ironlog_fitness_flutter.git)
```

2. **Install dependencies**
```bash
flutter pub get
```
3. **Run the app**
```bash
flutter run
```
---

*Developed by Aditya Sulistyo - 2026*

```
