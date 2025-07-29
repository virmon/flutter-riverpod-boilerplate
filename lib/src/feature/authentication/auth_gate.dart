import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Auth Gate'),
            ElevatedButton(
              onPressed: () => context.goNamed(AppRoute.home.name),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
