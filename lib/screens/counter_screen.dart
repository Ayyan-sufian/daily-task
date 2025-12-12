import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';
import '../provider/theme_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CounterProvider>(); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              provider.isSwapped ? '${provider.count}' : provider.fullName,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            Text(
              provider.isSwapped ? provider.fullName : '${provider.count}',
              style: const TextStyle(fontSize: 80),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => provider.increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () => provider.reset(),
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () => provider.swapOption(),
            child: const Icon(Icons.swap_vert_circle_outlined),
          ),
          const SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () => provider.name(),
            child: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
