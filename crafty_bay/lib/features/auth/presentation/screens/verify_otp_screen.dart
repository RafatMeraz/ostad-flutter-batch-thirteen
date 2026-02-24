import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';
import '../widgets/resend_otp_section.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpTEController = PinInputController();

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
                  Text('Enter OTP Code', style: context.textTheme.titleLarge),
                  Text(
                    'A 4 digit otp has been sent to your email address',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  MaterialPinField(
                    length: 4,
                    pinController: _otpTEController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    theme: MaterialPinTheme(
                      shape: MaterialPinShape.outlined,
                      fillColor: Colors.transparent,
                      borderColor: AppColors.themeColor,
                      completeFillColor: Colors.transparent,
                      completeBorderColor: AppColors.themeColor,
                      spacing: 16,
                      cellSize: Size(50, 50),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignInButton,
                    child: Text('Verify'),
                  ),
                  const SizedBox(height: 16),
                  ResendOtpSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {}

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}