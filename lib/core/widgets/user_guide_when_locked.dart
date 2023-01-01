import 'package:animated_car_security/core/constants/colors.dart';
import 'package:animated_car_security/core/constants/strings.dart';
import 'package:animated_car_security/core/widgets/arrow_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserGuideWhenLocked extends StatelessWidget {
  const UserGuideWhenLocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: blue.withOpacity(.1),
                    blurRadius: 15,
                    spreadRadius: 5),
              ],
            ),
            child: SvgPicture.asset(
              keySvg,
              width: 30,
              color: blue,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ArrowUp(),
        ],
      ),
    );
  }
}
