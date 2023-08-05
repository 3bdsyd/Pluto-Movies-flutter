import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInWithGoogleWidget extends StatelessWidget {
  const SignInWithGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 2, child: Container()),
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(
                width: 1,
              ),
            ),
            child: Image.asset(
              'assets/images/icon_google.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Text(
          'OR',
          style: context.theme.textTheme.labelSmall,
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Image.asset(
              'assets/images/icon_apple.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }
}
