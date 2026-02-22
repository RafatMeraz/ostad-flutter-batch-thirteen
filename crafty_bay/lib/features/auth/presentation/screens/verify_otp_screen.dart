import 'dart:async';

import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpTEController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Timer? _resendOtpTimer;

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

  void _onTapSignUpButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}

class ResendOtpSection extends StatefulWidget {
  const ResendOtpSection({
    super.key,
  });

  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  Timer? _timer;
  int _start = 30;
  bool _showResendOtpButton = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 30;
    _showResendOtpButton = false;
    setState(() {});

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        _showResendOtpButton = true;
      } else {
        _start--;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_showResendOtpButton)
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black54),
              children: [
                TextSpan(text: 'You can resend OTP after '),
                TextSpan(
                  text: '${_start}s',
                  style: TextStyle(color: AppColors.themeColor, fontWeight: .w600),
                ),
              ],
            ),
          ),
        if (_showResendOtpButton)
          TextButton(
            onPressed: _onTapSignUpButton,
            child: Text('Resend OTP'),
          ),
      ],
    );
  }

  void _onTapSignUpButton() {
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
