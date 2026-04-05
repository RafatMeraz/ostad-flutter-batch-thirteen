import 'package:crafty_bay/features/auth/data/models/sign_up_params.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../../../../app/validators.dart';
import '../widgets/app_logo.dart';
import 'verify_otp_screen.dart';

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

  final SignUpProvider _signUpProvider = SignUpProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const .all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) => Validators.validateEmail(value),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'First name'),
                      validator: (value) => Validators.validateNullOrEmpty(
                        value,
                        'Enter your first name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameTEController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'Last name'),
                      validator: (value) => Validators.validateNullOrEmpty(
                        value,
                        'Enter your last name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneTEController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'Phone'),
                      validator: (value) => Validators.validateNullOrEmpty(
                        value,
                        'Enter your phone',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _cityTEController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'City'),
                      validator: (value) => Validators.validateNullOrEmpty(
                        value,
                        'Enter your city name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    const SizedBox(height: 16),
                    Consumer<SignUpProvider>(
                      builder: (context, _, _) {
                        if (_signUpProvider.signUpInProgress) {
                          return CenterProgressIndicator();
                        }

                        return FilledButton(
                          onPressed: _onTapSignUpButton,
                          child: Text('Sign Up'),
                        );
                      },
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
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      email: _emailTEController.text.trim(),
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      phone: _phoneTEController.text.trim(),
      city: _cityTEController.text.trim(),
      password: _passwordTEController.text,
    );
    final bool isSuccess = await _signUpProvider.signUp(params);
    if (isSuccess) {
      Navigator.pushNamed(context, VerifyOtpScreen.name);
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMessage!);
    }
  }

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
