import 'package:animated_car_security/core/constants/colors.dart';
import 'package:animated_car_security/core/constants/lock_state.dart';
import 'package:animated_car_security/core/widgets/user_guide_when_locked.dart';
import 'package:animated_car_security/core/widgets/user_guide_when_unlocked.dart';
import 'package:animated_car_security/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedButton extends HookWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(.2),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(10, 5),
          ),
        ],
        gradient: const RadialGradient(
          focalRadius: .5,
          radius: 1.2,
          colors: [
            grey,
            darkGrey,
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15,
        ),
        width: 110,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black,
        ),
        child: ValueListenableBuilder<LockState>(
            valueListenable: HomePage.lockStateNotifier,
            builder: (context, lockState, _) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  if (lockState == LockState.locked)
                    const UserGuideWhenLocked(),

                  if (lockState == LockState.unlocked)
                    const UserGuideWhenUnLocked(),

                ],
              );
            }),
      ),
    );
  }
}
