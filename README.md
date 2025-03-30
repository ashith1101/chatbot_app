# Flutter Chatbot UI

A professional chatbot UI implementation in Flutter with beautiful animations and a design that makes future backend integration easy.

## Features

- 💬 Professional chat interface with message bubbles
- 🌓 Light and dark theme support
- ✨ Smooth animations and transitions
- ⌨️ Typing indicators
- 🤖 Mock responses with artificial delay
- 📱 Responsive design for various screen sizes
- 🔄 Easy backend integration path

## Tech Stack

- Flutter (3.0.0 or higher)
- Dart
- Provider (for state management)
- Material Design 3

## Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/ashith1101/chatbot_app.git
cd flutter_chatbot
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Running on an Emulator

#### Android Emulator Setup
1. Open Android Studio
2. Go to Tools > Device Manager
3. Click "Create Device"
4. Select a device definition (e.g., Pixel 6)
5. Download and select a system image (recommend API 33)
6. Complete the setup and name your device
7. Start the emulator:
   ```bash
   # List available emulators
   flutter emulators
   
   # Start an emulator
   flutter emulators --launch <emulator_id>
   
   # Run the app
   flutter run
   ```

#### iOS Simulator (macOS only)
1. Install Xcode from the App Store
2. Open Xcode > Preferences > Components
3. Install a simulator
4. Run:
   ```bash
   # Open simulator
   open -a Simulator
   
   # Run the app
   flutter run
   ```

### 4. Running on Physical Device (USB Debugging)

#### Android Device
1. Enable Developer Options:
   - Go to Settings > About Phone
   - Tap "Build Number" 7 times
   - Go back to Settings > Developer Options
   - Enable "USB debugging"

2. Connect your device:
   ```bash
   # Verify device is connected
   flutter devices
   
   # Run the app
   flutter run
   ```

#### iOS Device
1. Install Xcode (macOS only)
2. Open the project's iOS module in Xcode
3. Sign the app with your Apple Developer account
4. Connect your iPhone via USB
5. Trust your computer on the iPhone
6. Run:
   ```bash
   flutter run
   ```

## Development

### Project Structure

```
lib/
├── models/        # Data models
├── screens/       # UI screens
├── widgets/       # Reusable widgets
├── services/      # Business logic
├── utils/         # Helper functions
└── main.dart      # Application entry point
```

### Available Commands

- `flutter run` - Run the app in debug mode
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app (macOS only)
- `flutter test` - Run tests
- `flutter clean` - Clean build files

## Troubleshooting

### Common Issues

1. Device not detected:
   - Check USB cable
   - Reinstall USB drivers
   - Enable USB debugging
   - Run `flutter doctor`

2. Build failures:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

3. Gradle issues:
   - Update Gradle version in `android/build.gradle`
   - Run `flutter clean` and rebuild

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Flutter team for the amazing framework
- Material Design for the beautiful UI components
- The Flutter community for their invaluable resources