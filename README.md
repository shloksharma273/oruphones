# OruPhones Flutter Internship Assessment

This Flutter project is developed as part of the OruPhones Flutter Internship Assessment. The assignment is designed to evaluate your Flutter development skills and problem-solving abilities by replicating key features of the OruPhones app available on the App Store and Play Store.

---

## Table of Contents
- [Features](#features)
- [State Management Approach](#state-management-approach)
- [Setup and Run Instructions](#setup-and-run-instructions)
- [Demo Video](#demo-video)
---


## Features

- **Splash Screen:**  
  - Authentication state check and persistence.
  - Requests notification permissions.
  - Conditional navigation based on user details (Home Screen vs. Confirm Name Screen).

- **Authentication Screens & Bottom Sheets:**  
  - Reusable components for Login OTP, Verify OTP, and Confirm Name screens.
  - Consistent logic for both standalone and in-app (bottom sheet) authentication triggers.

- **Home Screen Components:**  
  - Smooth scrolling behavior with sticky/hiding app bar elements.
  - Product card grid with pagination and dynamic loading.
  - Like functionality with visual feedback and conditional login.

- **Firebase Cloud Messaging (FCM):**  
  - Push notifications integrated for foreground, background, and terminated states.
  - Permission handling during the splash screen.

---

## State Management Approach

The project uses `setState` for managing application state.


## Setup and Run Instructions

### Prerequisites

- **Flutter SDK:** [Installation Guide](https://flutter.dev/docs/get-started/install)
- **Dart SDK:** Bundled with Flutter.
- **IDE:** Android Studio, VSCode, IntelliJ IDEA, or your preferred editor.
- **Device/Emulator:** Physical device or emulator for testing.
  
### Steps to Set Up

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/shloksharma273/oruphones.git
   cd oruphones-flutter-assessment

2. **Run main.dart**
   ```bash
   flutter run
### Demo Video

Watch the app demo here: [(https://www.youtube.com/watch?v=ZrI15Qp5Qn4)]
