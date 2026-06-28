import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GenderSelector extends StatelessWidget {
  final bool isFemale;
  final Function(bool) onChanged;

  const GenderSelector({
    super.key,
    required this.isFemale,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // ================= Female =================
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: isFemale
                      ? AppColors.femalePrimary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      color: isFemale ? Colors.white : AppColors.femalePrimary,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      "Female",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isFemale
                            ? Colors.white
                            : AppColors.femalePrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ================= Male =================
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: !isFemale ? AppColors.malePrimary : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      color: !isFemale ? Colors.white : AppColors.malePrimary,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      "Male",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: !isFemale ? Colors.white : AppColors.malePrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
