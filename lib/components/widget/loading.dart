import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingAnimation() {
  return Center(
    child: LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: 20,
    ),
  );
}
