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
        children: <Widget> [
          ArrowDown(),
          SizedBox(
            height: 10,
          ),
          Container(
            child: SvgPicture.asset(lockSvg)
          )
        ],
      ),
    );
  }
}
