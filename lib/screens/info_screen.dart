import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class InfoScreen extends StatelessWidget {
  final bool isFemale;

  const InfoScreen({super.key, this.isFemale = true});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = isFemale
        ? AppColors.femalePrimary
        : AppColors.malePrimary;

    final Color backgroundColor = isFemale
        ? AppColors.femaleBackground
        : AppColors.maleBackground;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: const Text("BMI Information"),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //-------------------------------------------------
            // BMI Chart
            //-------------------------------------------------
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/bmi_chart.png", fit: BoxFit.cover),
            ),
            const SizedBox(height: 1),
            Text("BMI Chart", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: primaryColor)),
            
            const SizedBox(height: 25),

            //-------------------------------------------------
            // What is BMI?
            //-------------------------------------------------
            Text(
              "What is BMI?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Body Mass Index (BMI) is a value calculated "
              "using a person's weight and height. "
              "It is commonly used to determine whether "
              "a person has a healthy body weight.",
              style: TextStyle(fontSize: 16, height: 1.6),
            ),

            const SizedBox(height: 25),

            //-------------------------------------------------
            // Formula
            //-------------------------------------------------
            Text(
              "BMI Formula",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Image.asset(
                  'assets/BMI_formula.png',  // ← your image path
                  fit: BoxFit.contain,
                  height: 100,  // adjust as needed
                ),
              ),
            ),
//            Container(
  ///            width: double.infinity,
     //         padding: const EdgeInsets.all(18),
//
  //            decoration: BoxDecoration(
    //            color: Colors.white,
      //          borderRadius: BorderRadius.circular(15),
        //      ),
//
  //            child: const Center(
    //            child: Text(
      //            "BMI = Weight (kg) ÷ Height² (m²)",
        //          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //      ),
            //  ),
           // ),

            const SizedBox(height: 30),

            //-------------------------------------------------
            // BMI Categories
            //-------------------------------------------------
            Text(
              "BMI Categories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 15),

            bmiRow("Underweight", "< 18.5", Colors.lightBlue),

            bmiRow("Normal", "18.5 - 24.9", Colors.green),

            bmiRow("Overweight", "25.0 - 29.9", Colors.amber),

            bmiRow("Obese", "30.0 - 39.9", Colors.orange),

            bmiRow("Extremely Obese", "40.0+", Colors.red),

            const SizedBox(height: 30),

            //-------------------------------------------------
            // Tips
            //-------------------------------------------------
            Text(
              "Healthy Tips",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "• Eat a balanced diet.\n\n"
              "• Exercise at least 150 minutes per week.\n\n"
              "• Drink enough water.\n\n"
              "• Get enough sleep.\n\n"
              "• Maintain a healthy weight.",
              style: TextStyle(fontSize: 16, height: 1.6),
            ),

            const SizedBox(height: 35),

            //-------------------------------------------------
            // Back Button
            //-------------------------------------------------
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //---------------------------------------------------------
  // BMI Row Widget
  //---------------------------------------------------------

  Widget bmiRow(String title, String range, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(
        leading: CircleAvatar(backgroundColor: color),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        trailing: Text(
          range,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
