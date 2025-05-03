# Clinics Project

## Overview

The Clinics Project is a comprehensive solution for managing clinic operations. It consists of multiple modules, including a self-service application, a core library, and an API. Each module is designed to work seamlessly together to provide a robust and scalable system for clinic management.

## Modules

### 1. **Clinics Self-Service Application**
- **Path**: `/clinics_self_service`
- **Description**: A Flutter-based application designed for patients and staff to interact with clinic services, such as registration, appointment scheduling, and more.
- **Key Features**:
  - Patient registration and management.
  - Appointment scheduling.
  - Multi-platform support (`armeabi-v7a` and `arm64-v8a`).

### 2. **Clinics Core**
- **Path**: `/clinics_core`
- **Description**: A Dart package providing foundational utilities, business logic, and reusable components for the Clinics Project.
- **Key Features**:
  - Functional programming utilities (`Either`, `Unit`, `Nil`).
  - REST client with authentication and logging.
  - State management utilities.
  - Messaging system for user notifications.

### 3. **Clinics API**
- **Path**: `/clinics_api`
- **Description**: A RESTful JSON server for managing clinic-related data, including user authentication, patient records, and test cataloging.
- **Key Features**:
  - Secure authentication using JWT.
  - Real-time communication via WebSocket.
  - Configurable server settings via `config.yaml`.

## Requirements

- **Flutter SDK**: Version 3.0 or higher.
- **Dart SDK**: Version 3.7.2 or higher.
- **Android Studio**: For building and debugging the self-service application.

## Setup Instructions

1. Clone the repository:
   ```bash
   gh repo clone StephaneAntonieto/clinics
   ```
2. Navigate to the desired module directory:
   - For the self-service application:
     ```bash
     cd clinics_self_service
     ```
   - For the core library:
     ```bash
     cd clinics_core
     ```
   - For the API:
     ```bash
     cd clinics_api
     ```
3. Follow the specific setup instructions in the README file of each module.

## Project Structure

- **`clinics_self_service/`**: The self-service application for patients and staff.
- **`clinics_core/`**: The core library providing shared utilities and logic.
- **`clinics_api/`**: The backend API for managing clinic data.
- **`README.md`**: Project documentation.
