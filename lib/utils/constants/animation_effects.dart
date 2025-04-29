import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sippy/utils/constants/app_colors.dart';

enum Position { top, bottom, left, right }

class AnimationEffects {
  static AnimationEffects? _instance;
  // Avoid self instance
  AnimationEffects._();
  static AnimationEffects get instance => _instance ??= AnimationEffects._();

  List<Effect<dynamic>>? slideInAnimationEffect(
    int index, {
    Position position = Position.left,
  }) {
    return [
      if (position == Position.left)
        SlideEffect(
          begin: const Offset(-.5, 0),
          end: const Offset(0, 0),
          duration: Duration(milliseconds: 500 * log(index + 5).toInt()),
        ),
      FadeEffect(
        duration: Duration(milliseconds: 500 * log(index + 5).toInt()),
      )
    ];
  }

  List<Effect<dynamic>>? productImageAnimation(int index) {
    return [
      FadeEffect(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: (500 * log(index + 3)).toInt()),
      ),
      SlideEffect(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: (500 * log(index + 3)).toInt()),
        begin: const Offset(0, .5),
        end: const Offset(0.0, 0.0),
      ),
    ];
  }

  List<Effect<dynamic>>? fadeInAnimation() {
    return [
      FadeEffect(
        duration: 500.ms,
      )
    ];
  }

  List<Effect<dynamic>>? slideAnimation({
    Position position = Position.bottom,
  }) {
    return [
      FadeEffect(
        duration: 500.ms,
      ),
      if (position == Position.top)
        SlideEffect(
          begin: const Offset(0, -.5),
          end: const Offset(0.0, 0.0),
          duration: 500.ms,
        ),
      if (position == Position.bottom)
        SlideEffect(
          begin: const Offset(0, .5),
          end: const Offset(0.0, 0.0),
          duration: 500.ms,
        ),
      if (position == Position.left)
        SlideEffect(
          begin: const Offset(-.5, 0),
          end: const Offset(0.0, 0.0),
          duration: 500.ms,
        ),
      if (position == Position.right)
        SlideEffect(
          begin: const Offset(.5, 0),
          end: const Offset(0.0, 0.0),
          duration: 500.ms,
        ),
    ];
  }

  List<Effect<dynamic>> shimmerAnimation({
    double size = .4,
  }) {
    return [
      ShimmerEffect(
        angle: 45,
        size: size,
        colors: [
          AppColors.greyColor.shade300,
          AppColors.greyColor.shade400,
          AppColors.greyColor.shade300,
        ],
        duration: const Duration(milliseconds: 1000),
      )
    ];
  }

  List<Effect<dynamic>> darkShimmerAnimation({
    double size = .4,
  }) {
    return [
      ShimmerEffect(
        angle: 45,
        size: size,
        colors: [
          AppColors.greyColor.shade600,
          AppColors.greyColor.shade700,
          AppColors.greyColor.shade600,
        ],
        duration: const Duration(milliseconds: 1000),
      )
    ];
  }

  List<Effect<dynamic>>? scaleAndShakeAnimation({int delayDuration = 2000}) {
    return [
      ScaleEffect(
        transformHitTests: true,
        delay: 500.ms,
        begin: const Offset(.8, .8),
        end: const Offset(1, 1),
        curve: Curves.easeIn,
        duration: 500.ms,
      ),
      ScaleEffect(
        transformHitTests: true,
        delay: 1000.ms,
        begin: const Offset(1.2, 1.2),
        end: const Offset(.9, .9),
        curve: Curves.easeIn,
        duration: 500.ms,
      ),
      ShakeEffect(
        curve: Curves.easeIn,
        duration: 1000.ms,
        delay: 1000.ms,
        hz: 1,
        rotation: 2,
      ),
      ShimmerEffect(
        angle: -45,
        delay: delayDuration.ms,
        curve: Curves.easeIn,
        duration: 1000.ms,
      )
    ];
  }

  List<Effect<dynamic>>? slideingAnimation() {
    return [
      FadeEffect(
        curve: Curves.easeIn,
        duration: 1000.ms,
      ),
      SlideEffect(
        begin: const Offset(-.3, 0),
        end: const Offset(.3, 0),
        duration: 1000.ms,
      ),
      SlideEffect(
        delay: 1000.ms,
        begin: const Offset(.2, 0),
        end: const Offset(-.3, 0),
        duration: 1000.ms,
      ),
    ];
  }

  List<Effect<dynamic>>? listTileAnimation(int index) {
    return [
      SlideEffect(
        begin: const Offset(-.2, 0),
        end: const Offset(0, 0),
        duration: Duration(milliseconds: 500 * log(index + 5).toInt()),
      ),
      FadeEffect(
        duration: Duration(milliseconds: 700 * log(index + 5).toInt()),
      )
    ];
  }

  List<Effect<dynamic>>? gridAnimation(int index) {
    return [
      SlideEffect(
        begin: index.isOdd ? const Offset(.2, 0) : const Offset(-.2, 0),
        end: const Offset(0, 0),
        duration: Duration(milliseconds: 500 * log(index + 5).toInt()),
      ),
      FadeEffect(
        duration: Duration(milliseconds: 700 * log(index + 5).toInt()),
      )
    ];
  }

  static List<Effect> slideFromBottom = [
    FadeEffect(
      duration: 500.milliseconds,
      curve: Curves.easeIn,
      begin: 0,
      end: 1,
    ),
    SlideEffect(
      begin: const Offset(0, .2),
      end: const Offset(0, 0),
      curve: Curves.easeIn,
      duration: 500.ms,
    ),
  ];
}
