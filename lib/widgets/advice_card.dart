import 'package:flutter/material.dart';

class AdviceCard extends StatelessWidget {
  final String advice;

  const AdviceCard({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Health Advice",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Text(advice, style: const TextStyle(fontSize: 16, height: 1.6)),
          ],
        ),
      ),
    );
  }
}
