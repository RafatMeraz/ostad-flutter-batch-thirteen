import 'package:flutter/material.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const .all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  AppLogo(width: 100, height: 100),
                  const SizedBox(height: 16),
                  Text(
                    'Login to Your Account',
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    'Sign In with your account details',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: .emailAddress,
                    textInputAction: .next,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignInButton,
                    child: Text('Sign In'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: _onTapSignUpButton,
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {}

  void _onTapSignUpButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
