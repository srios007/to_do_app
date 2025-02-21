import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../utils/palette.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Colors.green,
          rightDotColor: Palette.mainColor,
          size: 30,
        ),
      ),
    );
  }
}
