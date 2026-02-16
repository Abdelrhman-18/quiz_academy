# Quiz Academy App

A comprehensive Flutter application for taking quizzes, tracking results, and managing user profiles.

## Features

-   **Authentication:** Secure login and registration system.
-   **Quizzes:** Take quizzes in various subjects (Science, Math, History, etc.).
-   **Results History:** Track your performance over time with detailed result history.
-   **Profile Management:** View your stats (Total Quizzes, Average Score) and manage your profile.
-   **Offline Support:** Uses SQLite to save results locally.

## Project Structure

The project follows a Clean Architecture approach with feature-based modularization:

-   `lib/core`: Core utilities, dependency injection, and shared widgets.
-   `lib/features`: Feature modules (Auth, Exam, Home, Profile, results_history).
    -   `data`: Data sources, models, and repositories.
    -   `domain`: Entities, repositories (interfaces), and use cases.
    -   `presentation`: UI (Pages, Widgets) and State Management (Cubits/Blocs).

## Getting Started

1.  **Prerequisites:**
    -   Flutter SDK installed.
    -   Dart SDK installed.

2.  **Installation:**
    ```bash
    flutter pub get
    ```

3.  **Running the App:**
    ```bash
    flutter run
    ```

4.  **Code Generation (for freezed/json_serializable/injectable):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

## Technologies Used

-   **Flutter & Dart**
-   **flutter_bloc:** For state management.
-   **get_it & injectable:** For dependency injection.
-   **sqflite:** For local database storage.
-   **go_router:** For navigation.
-   **flutter_screenutil:** For responsive design.

## Contributing

1.  Fork the repository.
2.  Create your feature branch (`git checkout -b feature/amazing-feature`).
3.  Commit your changes (`git commit -m 'Add some amazing feature'`).
4.  Push to the branch (`git push origin feature/amazing-feature`).
5.  Open a Pull Request.
