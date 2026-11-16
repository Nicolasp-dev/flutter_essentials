import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Page')),
      body: Center(
        child: FilledButton(onPressed: () {}, child: const Text('Button')),
      ),
    );
  }
}
