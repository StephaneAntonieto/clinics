# Clinics Self-Service Application

## Overview

The Clinics Self-Service Application is designed to streamline clinic operations by providing a user-friendly interface for patients and staff. This application is built using Flutter and integrates with various Android components to deliver a seamless experience.

## Project Structure

- **`lib/`**: Flutter application source code.
- **`.config/`**: Contains environment-specific configurations (not versioned).
- **`.vscode/`**: Contains Visual Studio Code settings for debugging and development.

## Requirements

- **Flutter SDK**: Version 3.0 or higher.
- **Android Studio**: For building and debugging the application.
- **Minimum SDK Version**: 21.

## Setup Instructions

1. Clone the repository:
   ```bash
   gh repo clone StephaneAntonieto/clinics
   ```
2. Navigate to the project directory:
   ```bash
   cd clinics_self_service
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Set up the `.config` directory:
   - Create a `.config` directory in the root of the project if it does not exist.
   - Add an `env.json` file inside `.config` with the following structure:
     ```json
     {
       "BACKEND_BASE_URL": "http://<your-backend-url>:<port>"
     }
     ```
     Replace `<your-backend-url>` and `<port>` with the appropriate values for your backend server.
5. Set up the `.vscode` directory:
   - Ensure the `.vscode` directory exists in the root of the project.
   - Add a `launch.json` file inside `.vscode` with the following configuration to load the `env.json` file:
     ```json
     {
       "version": "0.2.0",
       "configurations": [
         {
            "name": "clinics_self_service DEV",
            "cwd": "clinics_self_service",
            "request": "launch",
            "type": "dart",
            "args": ["--dart-define-from-file", ".config/env.json"]
         }
       ]
     }
     ```
6. Build the application:
   ```bash
   flutter build apk
   ```

## Notes

- The `.config` directory is not versioned and must be manually set up. It typically contains sensitive or environment-specific configurations.
- The `.config` directory should include an `env.json` file that specifies environment variables such as the backend server URL.
- The `.vscode` directory includes settings and launch configurations to simplify development in Visual Studio Code. Ensure it is correctly configured before starting development.
- The `launch.json` file in `.vscode` automate the process of loading environment variables from `env.json` before running the application.
