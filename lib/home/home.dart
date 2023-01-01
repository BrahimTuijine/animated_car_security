import 'package:animated_car_security/core/constants/colors.dart';
import 'package:animated_car_security/core/constants/lock_state.dart';
import 'package:animated_car_security/core/constants/strings.dart';
import 'package:animated_car_security/core/widgets/animated_button.dart';
import 'package:animated_car_security/core/widgets/background_clipper.dart';
import 'package:animated_car_security/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  static ValueNotifier<LockState> lockStateNotifier =
      ValueNotifier(LockState.unlocked);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomAppBar(
          color: black,
          child: BottomNavBarChild(),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 1,
                  colors: [grey, black],
                ),
              ),
            ),
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [darkGrey, grey],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.bluetooth_connected_rounded,
                          color: blue,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Bluetooth',
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      bmwSvg,
                      height: 60,
                    ),
                    const AnimatedButton(),
                    ValueListenableBuilder(
                        valueListenable: lockStateNotifier,
                        builder: (context, lockState, _) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(lockState.value),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
