import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tacticle_app/models/style.dart';

Widget loadingAnimation() {
  return Center(
    child: LoadingAnimationWidget.staggeredDotsWave(
      color: ColorTheme.blackColor,
      size: 20,
    ),
  );
}
