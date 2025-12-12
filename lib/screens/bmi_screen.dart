import 'package:daily_task/provider/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider = context.watch<BmiProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text(" BMI Calculator"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Height (feet)'),
              onChanged: (value) => bmiProvider.setHeight(value),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              onChanged: (value) => bmiProvider.setWeight(value),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
              onChanged: (value) => bmiProvider.setAge(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => bmiProvider.calculateBmi(),
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 30),
            if (bmiProvider.bmi > 0) ...[
              Text(
                'BMI: ${bmiProvider.bmi.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Category: ${bmiProvider.category}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Age: ${bmiProvider.age}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: () => bmiProvider.reset(),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
