import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIGauge extends StatelessWidget {
  final double bmi;
  final String category;

  const BMIGauge({super.key, required this.bmi, required this.category});

  /// จำกัดค่า BMI ให้อยู่ในช่วงที่ Gauge แสดง
  double get gaugeValue {
    if (bmi < 10) return 10;
    if (bmi > 45) return 45;
    return bmi;
  }

  /// สีของข้อความตามหมวดหมู่
  Color get categoryColor {
    switch (category) {
      case "Underweight":
        return Colors.blue;

      case "Normal":
        return Colors.green;

      case "Overweight":
        return Colors.orange;

      case "Obese":
        return Colors.deepOrange;

      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Text(
              "Your BMI",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 250,

              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 10,

                    maximum: 45,

                    startAngle: 180,

                    endAngle: 0,

                    showTicks: false,

                    showLabels: false,

                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.22,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),

                    ranges: [
                      GaugeRange(
                        startValue: 10,
                        endValue: 18.5,
                        color: Colors.blue,
                      ),

                      GaugeRange(
                        startValue: 18.5,
                        endValue: 25,
                        color: Colors.green,
                      ),

                      GaugeRange(
                        startValue: 25,
                        endValue: 30,
                        color: Colors.orange,
                      ),

                      GaugeRange(
                        startValue: 30,
                        endValue: 40,
                        color: Colors.deepOrange,
                      ),

                      GaugeRange(
                        startValue: 40,
                        endValue: 45,
                        color: Colors.red,
                      ),
                    ],

                    pointers: [
                      NeedlePointer(
                        value: gaugeValue,

                        enableAnimation: true,

                        animationDuration: 1500,

                        needleColor: const Color.fromARGB(255, 22, 22, 22),

                        knobStyle: const KnobStyle(color: Color.fromARGB(255, 7, 7, 7)),
                      ),
                    ],

                    annotations: [
                      GaugeAnnotation(
                        angle: 90,

                        positionFactor: 0.05,

                        widget: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            const SizedBox(height: 100), 
                            Text(
                              bmi.toStringAsFixed(1),

                              style: const TextStyle(
                                fontSize: 50,
                                color: Color.fromARGB(255, 30, 30, 30),

                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "BMI Category",

              style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
            ),

            const SizedBox(height: 8),

            Text(
              category,

              style: TextStyle(
                fontSize: 24,

                fontWeight: FontWeight.bold,

                color: categoryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
