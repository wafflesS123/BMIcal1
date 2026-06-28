import '../constants/bmi_constants.dart';
import '../models/bmi_result.dart';

//  Unit conversion
//  BMI calculation
//  Category determination
//  Advice generation

class BMIService {
  static BMIResult calculateBMI({
    required double weight,
    required double height,
    required int age,
    required String gender,
    required String weightUnit,
    required String heightUnit,
  }) {
    double weightKg = weight;
    if (weightUnit == "lbs") {
      weightKg = weight * 0.453592;
    }
    double heightMeter = height;
    if (heightUnit == "cm") {
      heightMeter = height / 100;
    }
    if (heightUnit == "inch") {
      heightMeter = height * 0.0254;
    }

    double bmi = weightKg / (heightMeter * heightMeter);
    bmi = double.parse(bmi.toStringAsFixed(1));
    String category;
    if (bmi < BMIConstants.underweight) {
      category = "Underweight";
    } else if (bmi < BMIConstants.normal) {
      category = "Normal";
    } else if (bmi < BMIConstants.overweight) {
      category = "Overweight";
    } else if (bmi < BMIConstants.obese) {
      category = "Obese";
    } else {
      category = "Extremely Obese";
    }

    String advice = BMIConstants.advice[category]!;
    return BMIResult(
      bmi: bmi,
      category: category,
      advice: advice,
      weight: weight,
      height: height,
      age: age,
      gender: gender,
    );
  }
}
