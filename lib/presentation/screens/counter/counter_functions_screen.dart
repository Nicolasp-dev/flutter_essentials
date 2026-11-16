import 'package:flutter/material.dart';

enum CounterAction { increment, decrement, restart }

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;
  String get clickLabel => counter == 1 ? 'Click' : 'Clicks';

  void updateState(CounterAction action) {
    final newValue = switch (action) {
      CounterAction.increment => counter + 1,
      CounterAction.decrement => counter > 0 ? counter - 1 : 0,
      CounterAction.restart => 0,
    };

    if (newValue == counter) return;
    setState(() => counter = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Challenge'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(clickLabel, style: const TextStyle(fontSize: 40)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            icon: Icons.refresh_sharp,
            onPressed: () => updateState(CounterAction.restart),
          ),
          CustomButton(
            icon: Icons.plus_one_sharp,
            onPressed: () => updateState(CounterAction.increment),
          ),
          CustomButton(
            icon: Icons.exposure_minus_1_sharp,
            onPressed: () => updateState(CounterAction.decrement),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({required this.icon, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(icon));
  }
}
