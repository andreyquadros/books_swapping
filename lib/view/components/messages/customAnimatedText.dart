import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  final String texto;
  const CustomAnimatedText({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [
          TypewriterAnimatedText(
            '$texto.', textAlign: TextAlign.center,
            textStyle: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.normal,
            ),
            speed: const Duration(milliseconds: 25),
          ),
        ],
        pause: const Duration(milliseconds: 500),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }
}
