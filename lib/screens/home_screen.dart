import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/bmi_result.dart';
import '../services/bmi_service.dart';
import '../widgets/gender_selector.dart';
import '../widgets/unit_dropdown.dart';
import '../widgets/custom_button.dart';

import 'result_screen.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool isFemale = true;
  String weightUnit = "kg";
  String heightUnit = "cm";
  Color get primaryColor =>
      isFemale ? AppColors.femalePrimary : AppColors.malePrimary;

  Color get backgroundColor =>
      isFemale ? AppColors.femaleBackground : AppColors.maleBackground;

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: backgroundColor,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GenderSelector(
                  isFemale: isFemale,
                  onChanged: (value) {
                    setState(() {
                      isFemale = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(
                    isFemale ? "assets/img2.png" : "assets/img1.png",
                    key: ValueKey(isFemale),
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Weight",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true), // ← for weight & height
                        decoration: InputDecoration(
                          hintText: "Enter weight",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: UnitDropdown(
                        value: weightUnit,
                        items: const ["kg", "lbs"],
                        onChanged: (value) {
                          setState(() {
                            weightUnit = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                const Text(
                  "Height",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: heightController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true), // ← for weight & height
                        decoration: InputDecoration(
                          hintText: "Enter height",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: UnitDropdown(
                        value: heightUnit,
                        items: const ["cm", "m", "inch"],
                        onChanged: (value) {
                          setState(() {
                            heightUnit = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                const Text(
                  "Age",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter age",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                CustomButton(
                  text: "Calculate BMI",
                  color: primaryColor,
                  onPressed: _calculateBMI,
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    side: BorderSide(color: primaryColor),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const InfoScreen()),
                    );
                  },
                  child: const Text(
                    "More Info",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculateBMI() {
  // Check empty fields
    if (weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    // Check weight is a valid number
    final double? weight = double.tryParse(weightController.text);
    if (weight == null || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid weight (e.g. 65.5)")),
      );
      return;
    }

    // Check height is a valid number
    final double? height = double.tryParse(heightController.text);
    if (height == null || height <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid height (e.g. 170.5)")),
      );
      return;
    }

    // Check age is a valid number
    final int? age = int.tryParse(ageController.text);
    if (age == null || age <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid age (e.g. 25)")),
      );
      return;
    }

    final BMIResult result = BMIService.calculateBMI(
      weight: weight,
      height: height,
      age: age,
      gender: isFemale ? "Female" : "Male",
      weightUnit: weightUnit,
      heightUnit: heightUnit,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ResultScreen(result: result)),
    );
  }
}
