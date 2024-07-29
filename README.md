
# Flutter Firebase Authentication App

This Flutter application provides user authentication features using Firebase. It includes functionalities such as creating an account, logging in, and logging out. The app is built using the Flutter framework and leverages Firebase's Authentication services.

## Features

- **User Authentication**: Create an account, log in, and log out using Firebase Authentication.
- **Secure Password Storage**: Passwords are securely stored using Firebase's authentication services.
- **Firebase Integration**: Seamlessly integrated with Firebase, including real-time database and analytics capabilities (optional).

## Getting Started

### Prerequisites

To run this project, you will need:

- Flutter SDK
- Dart
- Firebase project set up (with Firebase Authentication enabled)
- A code editor like VS Code or Android Studio

### Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/saumyasinha31/Authentication.git
   cd flutter-firebase-authentication
   ```

2. **Install dependencies**:

   ```sh
   flutter pub get
   ```

3. **Set up Firebase**:

   - Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.
   - Enable Firebase Authentication.
   - Download the `google-services.json` file for Android and `GoogleService-Info.plist` for iOS and place them in the appropriate directories (`android/app` and `ios/Runner`, respectively).

4. **Run the application**:

   ```sh
   flutter run
   ```

## Configuration

Make sure to configure Firebase correctly in your Flutter project:

1. **Firebase Initialization**:
   The Firebase initialization code is located in `main.dart`. The app initializes Firebase at the start using the configuration provided in `firebase_options.dart`.

2. **Firebase Authentication Methods**:
   - `Methods.dart` contains functions for creating an account, logging in, and logging out using Firebase.

## Usage

1. **Creating an Account**:
   - Navigate to the registration screen and enter your name, email, and password. Press "Create Account" to register.

2. **Logging In**:
   - On the login screen, enter your email and password. Press "Login" to access your account.

3. **Logging Out**:
   - You can log out by using the log-out function in the app.

## Dependencies

The project relies on the following packages:

- `flutter`: The Flutter framework.
- `firebase_core`: Core functionalities for Firebase integration.
- `firebase_auth`: Firebase Authentication SDK.

To view all dependencies, check the `pubspec.yaml` file.

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/YourFeature`)
3. Commit your Changes (`git commit -m 'Add some feature'`)
4. Push to the Branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

