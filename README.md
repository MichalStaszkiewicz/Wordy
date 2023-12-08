<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="assets/logo.png" alt="Logo">
  </a>

</div>

## About Wordy

Wordy is a mobile language learning app that helps users quickly and effectively master new language skills in an engaging and interactive way. With its motivational achievement system, fun and engaging quizzes, and well-structured language courses, Wordy provides a comprehensive learning experience that keeps users motivated and engaged.

## 🏆 Key Features 🏆

- Motivating Achievement System: Wordy gamifies language learning with a rewarding achievement system that keeps users motivated and engaged.

- Interactive Quizzes: Fun and engaging quizzes enhance learning and make it more enjoyable and effective.

- Structured Language Courses: Well-organized courses with manageable topics provide a solid foundation for language acquisition.

### 🚀 Built With Flutter 🚀

Wordy is built using the Flutter framework, a cross-platform development toolkit that allows developers to create native mobile apps for Android and iOS from a single codebase. This makes Wordy a versatile and accessible app that can be enjoyed on a wide range of devices.

## 🛠️ Getting Started 🛠️

### Prerequisites

- **Operating system:** Windows, macOS, or Linux

- **Flutter SDK:** Install the Flutter SDK from [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install).

- **Android Studio (or VS Code with Flutter extension):** Install Android Studio or VS Code with Flutter extension for development and debugging.

- **Android emulator or physical Android device:** Set up an Android emulator or connect a physical Android device for testing purposes.

- **Server:** Clone and configure the server, which serves data for the app. Follow the instructions on the server project's repository: [https://github.com/MichalStaszkiewicz/wordy-server](https://github.com/MichalStaszkiewicz/wordy-server) to set up the server correctly.

## Installation

1. Clone the project using the following command:

   ```sh
   git clone https://github.com/MichalStaszkiewicz/Wordy.git
   ```

2. Install the project dependencies using the following command:
   ```sh
   flutter pub get
   ```
3. Create a `.env` file in the project directory and add the following environment variables:

```env
API_URL_DEBUG= "http://[YOUR_LOCAL_IP]:1344"
API_URL_IMAGES_DEBUG= "http://[YOUR_LOCAL_IP]:1344/v1/images/"
```

Replace [YOUR_LOCAL_IP] with the IP address of the machine where the server is running.

4. Connect physical phone or run an emulator.

5. Run the project using the following command:
   ```sh
   flutter run
   ```

### Finding your IP address

#### Windows:

1. Open the Command Prompt by pressing `Win + R` and typing `cmd`, then press Enter.
2. In the Command Prompt, type `ipconfig` and press Enter.
3. Look for the "IPv4 Address" under the network adapter you are connected to. It will be listed as a series of numbers separated by periods (e.g., 192.168.0.1).

#### Mac:

1. Open the Terminal by going to Applications -> Utilities -> Terminal.
2. In the Terminal, type `ifconfig` and press Enter.
3. Look for the "inet" or "inet addr" entry under the network adapter you are connected to. It will be listed as a series of numbers separated by periods (e.g., 192.168.0.1).

#### Linux:

1. Open the Terminal.
2. In the Terminal, type `ifconfig` or `ip addr show` and press Enter.
3. Look for the "inet" or "inet addr" entry under the network adapter you are connected to. It will be listed as a series of numbers separated by periods (e.g., 192.168.0.1).

## 🎉 Usage Examples 🎉

1. Upon launching the application, you will be prompted to create an account or log in. 🔐
2. After creating an account or logging in, you can access the main menu. 👋
3. From the main menu, you can start learning words and expand your vocabulary. 🧠
4. The app allows you to unlock achievements as you make progress in your learning journey. 🏅
5. You can track your learning progress and view your achievements in your user profile. 📈

## Project Status

The Wordy project is currently developed by a single developer. I am continuously working on adding new features and improving the user experience of the application.
