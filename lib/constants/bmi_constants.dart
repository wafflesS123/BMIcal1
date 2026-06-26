// BMI category
class BMIConstants {
  static const double underweight = 18.5;
  static const double normal = 25.0;
  static const double overweight = 30.0;
  static const double obese = 40.0; //other than this would be extremely obese
  static const Map<String, String> advice = {
    "Underweight":
        "• Increase your calorie intake.\n"
        "• Eat more protein-rich foods.\n"
        "• Include strength training.\n"
        "• Get enough sleep.",

    "Normal":
        "• Great job! Maintain your current lifestyle.\n"
        "• Exercise regularly.\n"
        "• Drink enough water.\n"
        "• Continue eating balanced meals.",

    "Overweight":
        "• Reduce sugary foods.\n"
        "• Exercise at least 30 minutes daily.\n"
        "• Eat more vegetables.\n"
        "• Reduce processed foods.",

    "Obese":
        "• Start a structured weight-loss plan.\n"
        "• Consult a healthcare professional.\n"
        "• Increase physical activity gradually.\n"
        "• Monitor calorie intake.",

    "Extremely Obese":
        "• Seek medical advice immediately.\n"
        "• Follow a supervised diet plan.\n"
        "• Exercise under professional guidance.\n"
        "• Monitor health regularly.",
  };
}
