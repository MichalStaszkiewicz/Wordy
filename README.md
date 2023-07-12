# Wordy

## Description
Wordy is a vocabulary-learning application that allows users to learn words, achieve milestones, and track their progress. The app provides features such as word learning, achievement unlocking, and progress tracking to enhance the language learning experience.

## Installation Instructions
To install the Wordy application, follow these steps:
1. Make sure you have Flutter installed on your system.
2. Clone the Wordy repository from GitHub.
3. Open a terminal and navigate to the project directory.
4. Run the command `flutter run` to launch the application on your device/emulator.

**Note:** Before running the application, you need to update the `urls.dart` file. Change the `kImageUrl` and `kBaseUrl` variables to your IP address as the server is hosted locally on your computer. Also, ensure that the Wordy-Server is running.

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

Once you have obtained your IP address, update the `kImageUrl` and `kBaseUrl` variables in the `urls.dart` file with your IP address.

## Usage Examples
1. Upon launching the application, you will be prompted to create an account or log in.
2. After creating an account or logging in, you can access the main menu.
3. From the main menu, you can start learning words and expand your vocabulary.
4. The app allows you to unlock achievements as you make progress in your learning journey.
5. You can track your learning progress and view your achievements in your user profile.

## Project Status
The Wordy project is currently developed by a single developer. I am continuously working on adding new features and improving the user experience of the application.
