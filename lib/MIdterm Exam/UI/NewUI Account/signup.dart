// lib/screens/login_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showSignUpBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return const SignUpBottomSheetContent();
    },
  );
}

class SignUpBottomSheetContent extends ConsumerStatefulWidget {
  const SignUpBottomSheetContent({super.key});

  @override
  ConsumerState<SignUpBottomSheetContent> createState() => _SignUpBottomSheetContentState();
}

class _SignUpBottomSheetContentState extends ConsumerState<SignUpBottomSheetContent> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _signUp() async {
    final db = ref.read(databaseProvider);

    // Check if username already exists
    final existingAdmin = await db.getAdmin(_usernameController.text, "");
    if (existingAdmin != null) {
      setState(() {
        _errorMessage = "Username already exists";
      });
      return;
    }

    // Add new admin
    final admin = Admin()
      ..username = _usernameController.text
      ..password = _passwordController.text;

    await db.addAdmin(admin.username, admin.password);
    Navigator.pop(context); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign Up", style: Theme.of(context).textTheme.headlineMedium),
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
                ElevatedButton(
                  onPressed: _signUp,
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}