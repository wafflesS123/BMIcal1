import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/bmi_result.dart';
import '../widgets/bmi_gauge.dart';
import '../widgets/advice_card.dart';
import 'info_screen.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final BMIResult result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final bool isFemale = result.gender == "Female";
    final Color primaryColor =
        isFemale ? AppColors.femalePrimary : AppColors.malePrimary;
    final Color backgroundColor =
        isFemale ? AppColors.femaleBackground : AppColors.maleBackground;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("BMI Result"),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BMIGauge(bmi: result.bmi, category: result.category),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Information",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const Divider(height: 30),
                    infoRow("Gender", result.gender),
                    infoRow("Weight", "${result.weight}"),
                    infoRow("Height", "${result.height}"),
                    infoRow("Age", "${result.age}"),
                    infoRow("BMI", result.bmi.toStringAsFixed(1)),
                    infoRow("Category", result.category),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              AdviceCard(advice: result.advice),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.info_outline),
                  label: const Text(
                    "More Information",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InfoScreen(isFemale: isFemale),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.home),
                  label: const Text(
                    "Back to Home",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    side: BorderSide(color: primaryColor),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(": ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            flex: 3,
            child: Text(value, style: const TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}