import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimations extends StatelessWidget {
  final Color cor;
  const LoadingAnimations({Key? key, required this.cor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70
            .withOpacity(0), // Isso cria um fundo semi-transparente
        child: Center(
            child: LoadingAnimationWidget.inkDrop(
          color: cor,
          size: 50,
        )));
  }
}
