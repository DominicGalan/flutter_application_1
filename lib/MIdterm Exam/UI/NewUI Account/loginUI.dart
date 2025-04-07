// lib/screens/login_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_application_1/MIdterm%20Exam/UI/NewUI%20Account/signup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showLoginBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the sheet to expand for larger content
    builder: (context) {
      return const LoginBottomSheetContent();
    },
  );
}

class LoginBottomSheetContent extends ConsumerStatefulWidget {
  const LoginBottomSheetContent({super.key});

  @override
  ConsumerState<LoginBottomSheetContent> createState() => _LoginBottomSheetContentState();
}

class _LoginBottomSheetContentState extends ConsumerState<LoginBottomSheetContent> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    final db = ref.read(databaseProvider);
    final admin = await db.getAdmin(_usernameController.text, _passwordController.text);

    if (admin != null) {
      ref.read(loggedInProvider.notifier).state = true;
      Navigator.pop(context); // Close the bottom sheet
    } else {
      setState(() {
        _errorMessage = "Invalid username or password";
      });
    }
  }

  Future<void> _signUp() async {
    // Navigate to the signup screen or handle signup logic here
    Navigator.pop(context); // Close the bottom sheet
    showSignUpBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // Avoid keyboard overlap
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _login,
                      child: const Text("Login"),
                    ),
                    OutlinedButton(
                      onPressed: _signUp,
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}