# Habit Tracker App

### A simple, user-friendly habit tracking application with offline functionality and Firebase integration.

## Features

- **Offline Support**: Track your habits even when offline. Your data will automatically sync with Firebase once an internet connection is available.
- **Firebase Integration**: Sync your habit data across devices in real-time using Firebase Realtime Database.
- **Firebase Authentication**: Secure login system to manage your habits after authentication.
- **Habit Management**:
  - **Create**: Add new habits to track.
  - **Read**: View your habits, including progress and completion status.
  - **Update**: Modify habit details as needed (e.g., goal, frequency).
  - **Delete**: Remove habits you no longer wish to track.
- **Progress Tracking**: View a visual representation of your habit progress over time.
- **Daily Reminders**: Set reminders for habits to help keep you on track.
- **User-friendly Interface**: Clean and intuitive design to make managing habits simple and efficient.
- **Completion Status**: Mark habits as completed for the day or week.

## Tech Stack

- **Frontend**: Flutter (for cross-platform compatibility and a responsive UI)
- **Backend**: Firebase Realtime Database (for real-time synchronization of habits)
- **Authentication**: Firebase Authentication (for secure user login)
- **Storage**: Local storage to track habits offline and sync when online

<details> 
  <summary><h2>📸Photos & Video</h2></summary>
  <p>
    <table align="center">
  <tr>
    <td><img src="https://github.com/user-attachments/assets/9cc90c95-b2eb-46e6-a5b3-97556ad3f3e8" alt="Image 1" width="180" height="auto"></td>
    <td><img src="https://github.com/user-attachments/assets/9fbb6a84-3396-458b-8688-4d98fb93b766" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/user-attachments/assets/4e341ab6-940a-4975-b449-c61676729807" alt="Image 3" width="180" height="auto"></td>
    <td><img src="https://github.com/user-attachments/assets/3e014c37-7280-4408-80a3-f06ffdf5e2c4" alt="Image 4" width="180" height="auto"></td>
  </tr>
    </table>    
  </p>
  </details>

  <details> 
  <summary><h2>DataBase & Video</h2></summary>

  <p>
    <table align="center">
  <tr>
    <td><img src="https://github.com/user-attachments/assets/268772b4-af1e-4bee-b99c-2b0e6b6d4dea" alt="Database" width="auto" height="auto"></td>
  </tr>
      <tr>
        <td><video src="https://github.com/user-attachments/assets/8574cf5c-9ea8-45da-bcb1-ece97679eb69" width="420" height="315"></video>
      </tr>
    </table>    
  </p>
  </details>

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/habit-tracker.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd habit-tracker
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Configure Firebase**:
   - Add your `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) to the appropriate directory.
   - Set up Firebase Realtime Database and Firebase Authentication in your Firebase project.

5. **Run the app**:
   ```bash
   flutter run
   ```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request.
