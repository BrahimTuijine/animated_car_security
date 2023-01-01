import 'package:animated_car_security/core/constants/colors.dart';
import 'package:animated_car_security/core/constants/strings.dart';
import 'package:animated_car_security/core/widgets/arrow_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserGuideWhenUnLocked extends StatelessWidget {
  const UserGuideWhenUnLocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: <Widget>[
          const ArrowDown(),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: red.withOpacity(.2),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]),
              child: SvgPicture.asset(
                lockSvg,
                width: 30,
                color: red,
              ))
        ],
      ),
    );
  }
}
