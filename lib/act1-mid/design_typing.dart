import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'func_typing.dart';
import 'dart:async';

class TypingScreen extends HookConsumerWidget {
  const TypingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider);
    final userInput = ref.watch(userInputProvider);
    final timer = ref.watch(timerProvider);
    final isRunning = ref.watch(timerRunningProvider);
    final timerNotifier = ref.read(timerProvider.notifier);
    final userInputNotifier = ref.read(userInputProvider.notifier);
    final timerRunningNotifier = ref.read(timerRunningProvider.notifier);
    final textController = useTextEditingController();

    useEffect(() {
      Timer? countdown;
      if (isRunning) {
        countdown = Timer.periodic(Duration(seconds: 1), (timer) {
          ref.read(timerProvider.notifier).state++;
        });
      }
      return () => countdown?.cancel();
    }, [isRunning]);

    void checkCompletion(String input) {
      userInputNotifier.state = input;
      if (!isRunning) {
        timerRunningNotifier.state = true;
      }
      if (input == text) {
        timerRunningNotifier.state = false;
      }
    }

    void restartTyping() {
      timerNotifier.state = 0; 
      userInputNotifier.state = "";
      textController.clear();
      timerRunningNotifier.state = false;
    }

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text("MiniTyping", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Text to Type: (Manually)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 20),
            Text("Time: $timer s",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            TextField(
              controller: textController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white),
              onChanged: checkCompletion,
              enabled: isRunning || userInput != text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Start typing here...",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (userInput == text)
              Text("Completed in $timer seconds!", style: TextStyle(fontSize: 18, color: Colors.green)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: restartTyping,
              child: Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
