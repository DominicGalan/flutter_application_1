import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_application_1/MIdterm%20Exam/UI/NewUI%20Account/loginUI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showAccountBottomSheet(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return AccountBottomSheetContent(ref: ref);
    },
  );
}

class AccountBottomSheetContent extends StatelessWidget {
  final WidgetRef ref;

  const AccountBottomSheetContent({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final isAdminLoggedIn = ref.watch(loggedInProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isAdminLoggedIn ? "Admin Account" : "Guest Account",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          if (isAdminLoggedIn)
            ElevatedButton(
              onPressed: () {
                ref.read(loggedInProvider.notifier).state = false;
                Navigator.pop(context); // Close the bottom sheet
              },
              child: const Text("Logout"),
            ),
          if (!isAdminLoggedIn)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                showLoginBottomSheet(context);
              },
              child: const Text("Login"),
            ),
        ],
      ),
    );
  }
}