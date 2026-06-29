# BMI Calculator App

## Brief Description

The **BMI Calculator App** is a Flutter application that helps users calculate their Body Mass Index (BMI) based on their height and weight. The app supports multiple measurement units (kg/lbs and cm/m/inches), allows users to select their gender and age, and provides personalized BMI results along with health advice.

The application features a modern and interactive user interface with gender-based color themes (pink for female and blue for male), an animated BMI gauge, and an information page explaining BMI categories and how BMI is calculated.

## Features

* Input weight, height, and age
* Support for multiple units:

  * Weight: Kilograms (kg) and Pounds (lbs)
  * Height: Centimeters (cm), Meters (m), and Inches (inch)
* Gender selection with dynamic color themes
* Automatic BMI calculation
* BMI classification:

  * Underweight
  * Normal
  * Overweight
  * Obese
  * Extremely Obese
* Animated BMI gauge displaying the user's BMI
* Personalized health advice based on BMI category
* BMI information page with chart and explanation
* Smooth navigation between screens

## Technologies Used

* Flutter
* Dart
* Syncfusion Flutter Gauges

## Project Structure

```text
lib/
├── constants/
├── models/
├── screens/
├── services/
├── widgets/
└── main.dart
```

## How to Run

1. Clone the repository.
2. Install dependencies:

```bash
flutter pub get
```

3. Run the application:

```bash
flutter run
```

## Authors

Developed as a Flutter mobile application project.
