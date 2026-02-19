import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
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
                  AppLogo(width: 100, height: 100),
                  const SizedBox(height: 16),
                  Text(
                    'Create Your Account',
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    'Get started with your details',
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
                    controller: _firstNameTEController,
                    textInputAction: .next,
                    decoration: InputDecoration(hintText: 'First name'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameTEController,
                    textInputAction: .next,
                    decoration: InputDecoration(hintText: 'Last name'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneTEController,
                    textInputAction: .next,
                    decoration: InputDecoration(hintText: 'Phone'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _cityTEController,
                    textInputAction: .next,
                    decoration: InputDecoration(hintText: 'City'),
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
                    onPressed: _onTapSignUpButton,
                    child: Text('Sign Up'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: _onTapSignInButton,
                    child: Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {}

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _cityTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
