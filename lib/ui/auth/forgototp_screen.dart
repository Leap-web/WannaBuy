import 'package:final_project/ui/auth/reset_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ForgototpScreen extends StatefulWidget {
  final String emailOrPhone;

  const ForgototpScreen({super.key, required this.emailOrPhone});

  @override
  State<ForgototpScreen> createState() => _ForgototpScreenState();
}

class _ForgototpScreenState extends State<ForgototpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  int _remainingTime = 59;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_otpFocusNodes[0]);
    });
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  bool _areAllFieldsFilled() {
    for (var controller in _otpControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1) {
      if (index < 5) {
        _otpFocusNodes[index + 1].requestFocus();
      } else {
        _otpFocusNodes[index].unfocus();
      }

      if (_areAllFieldsFilled()) {
        Future.delayed(const Duration(milliseconds: 300), _verifyAndNavigate);
      }
    } else if (value.isEmpty && index > 0) {
      _otpFocusNodes[index - 1].requestFocus();
    }
  }

  void _verifyAndNavigate() {
    String otp = '';
    for (var controller in _otpControllers) {
      otp += controller.text;
    }
    print('Verifying OTP: $otp for ${widget.emailOrPhone}');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResetScreen()),
    );
  }

  String _maskEmailOrPhone(String input) {
    if (input.contains('@')) {
      final parts = input.split('@');
      if (parts[0].length > 3) {
        return 'email ${parts[0].substring(0, 3)}****@${parts[1]}';
      }
      return 'email ${parts[0].substring(0, 1)}****@${parts[1]}';
    } else {
      if (input.length >= 4) {
        return 'phone number ${input.substring(0, 3)}****${input.substring(input.length - 1)}';
      }
      return 'phone number ****${input.substring(input.length - 1)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 40, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background.png', fit: BoxFit.cover),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: const Text(
                      "LET'S RESET",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 220),
                  // OTP Verification Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'SMS Code verification',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: const Offset(
                                      0,
                                      2,
                                    ), // Only vertical offset (bottom shadow)
                                  ),
                                ],
                              ),
                              child: Container(
                                width: 39,
                                height: 52,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3.1,
                                ),
                                child: TextField(
                                  controller: _otpControllers[index],
                                  focusNode: _otpFocusNodes[index],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onChanged:
                                      (value) => _onOtpChanged(value, index),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'OTP was sent to ${_maskEmailOrPhone(widget.emailOrPhone)}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        // Timer display
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '00:${_remainingTime.toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
