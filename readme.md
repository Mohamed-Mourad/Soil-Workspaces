# Tayf - Soil Flutter development task

Develop a basic workspace booking feature for a mobile app using Flutter. The goal of this task 
is to evaluate your Flutter development skills, including UI/UX implementation, state management, 
API integration (optional), and overall code quality.

## Features

- **View Workspaces**: Easily view workspaces with their location, images, and available amenities.
- **Reserve Workspace**: reserve workspace for one or more slots.
- **View Workspace Slots**: view available and reserved slots for a workspace.


## Getting Started

### Prerequisites

Ensure you have Flutter 3.2 and java 21 and MySQL installed on your machine.

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/Mohamed-Mourad/Budget-Tracker.git
   
2. Navigate to the project directory:
   ```sh
   cd {path where you cloned the project}
3. Install the dependencies of the flutter project:
   ```sh
   flutter pub get
   
4. Create database on MySQL
5. Run backend project
6. Run Flutter project:
   ```sh
   flutter run
   
## Project Structure

Here is a brief overview of the springboot project structure:  

java/com.soil.springboot.soil_springboot_backend/

├── controllers/  
├── models/                # Contains Entities and DTOs   
├── repositories/  
├── services/ 


Here is a brief overview of the flutter project structure:  
lib/  
├── blocs/               # Contains BLoC files  
├── data/                # Contains data layer of the app  
├── models/              # Contains data models  
├── repositories/        # Contains repository files  
├── screens/             # Contains UI screens  
├── widgets/             # Contains reusable widgets  
├── main.dart            # Entry point of the app
