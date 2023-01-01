import 'package:animated_car_security/core/constants/colors.dart';
import 'package:animated_car_security/core/constants/lock_state.dart';
import 'package:animated_car_security/core/constants/strings.dart';
import 'package:animated_car_security/core/widgets/user_guide_when_locked.dart';
import 'package:animated_car_security/core/widgets/user_guide_when_unlocked.dart';
import 'package:animated_car_security/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedButton extends HookWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(seconds: 1));

    final animation = useAnimation<Alignment>(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut)
          .drive(
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );

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
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Align(
                        alignment: animation,
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            if (details.delta.dy > 0 &&
                                lockState == LockState.unlocked) {
                              animationController.forward();
                              Future.delayed(
                                const Duration(
                                  seconds: 1,
                                ),
                                () {
                                  HomePage.lockStateNotifier.value =
                                      LockState.locked;
                                },
                              );
                            } else if (details.delta.dy < 0 &&
                                lockState == LockState.locked) {
                              animationController.reverse();
                              Future.delayed(
                                const Duration(
                                  seconds: 1,
                                ),
                                () {
                                  HomePage.lockStateNotifier.value =
                                      LockState.unlocked;
                                },
                              );
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: lockState == LockState.locked
                                          ? [red, redDark]
                                          : [blue, blueDark]),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 20,
                                        spreadRadius: 10,
                                        color: lockState == LockState.locked
                                            ? red.withOpacity(.2)
                                            : blue.withOpacity(.2))
                                  ]),
                              child: lockState == LockState.locked
                                  ? SvgPicture.asset(
                                      lockSvg,
                                      width: 30,
                                      color: Colors.white,
                                    )
                                  : SvgPicture.asset(
                                      keySvg,
                                      width: 30,
                                      color: Colors.white,
                                    )),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
