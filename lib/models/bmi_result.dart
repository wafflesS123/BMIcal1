// stored bmi information pass from home to result
class BMIResult {
  final double bmi;
  final String category;
  final String advice;
  final double weight;
  final double height;
  final int age;
  final String gender;

  BMIResult({
    required this.bmi,
    required this.category,
    required this.advice,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });

  ///
  /// Convert object into Map
  /// (Useful if later storing into database)
  ///
  Map<String, dynamic> toMap() {
    return {
      'bmi': bmi,
      'category': category,
      'advice': advice,
      'weight': weight,
      'height': height,
      'age': age,
      'gender': gender,
    };
  }

  ///
  /// Create BMIResult from Map
  ///
  factory BMIResult.fromMap(Map<String, dynamic> map) {
    return BMIResult(
      bmi: map['bmi'],
      category: map['category'],
      advice: map['advice'],
      weight: map['weight'],
      height: map['height'],
      age: map['age'],
      gender: map['gender'],
    );
  }

  @override
  String toString() {
    return '''
BMIResult(
BMI : $bmi,
Category : $category,
Gender : $gender,
Weight : $weight,
Height : $height,
Age : $age
)
''';
  }
}
