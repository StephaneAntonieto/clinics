# Clinics API

The **Clinics API** is a RESTful JSON server designed to manage clinic-related data, including user authentication, patient management, and test cataloging.

## Features

- **User Authentication**: Secure authentication using JWT.
- **Patient Management**: Manage patient records and related data.
- **Test Cataloging**: Maintain a catalog of medical tests.
- **WebSocket Support**: Real-time communication via WebSocket.

## Configuration

The server configuration is managed through the `config.yaml` file. Key settings include:

- **Server Name**: `Json Rest Server`
- **Host**: `<YOUR_SERVER_IP>`
- **Port**: `8080`
- **Database File**: `database.json`
- **WebSocket**:
  - Enabled: `true`
  - Port: `8081`
- **Authentication**:
  - JWT Secret: `<YOUR_JWT_SECRET>`
  - Token Expiration: `3600` seconds
  - Public Endpoints:
    - `/images/` (GET)
    - `/users` (POST)
    - `/adm_users` (POST)

## Database Structure

The database is stored in `database.json` and includes the following collections:

- **users**: Stores user information.
- **adm_users**: Stores admin user information.
- **attendantDeskAssignment**: Currently empty.
- **patients**: Currently empty.
- **patientInformationForm**: Currently empty.
- **painelCheckin**: Currently empty.
- **tests**: Contains a catalog of medical tests.

## Getting Started

1. Clone the repository to your local machine.
2. Ensure the `config.yaml` file is properly configured.
3. Replace placeholders like `<YOUR_SERVER_IP>` and `<YOUR_JWT_SECRET>` with your own values.
4. Install the `json_rest_server` Flutter package globally:
   ```bash
   dart pub global activate json_rest_server
   ```
5. Start the server using the following command:
   ```bash
   jrs run
   ```

## API Endpoints

The API provides endpoints for managing users, patients, and tests. Authentication is required for most endpoints, except those explicitly listed as public in the configuration.
