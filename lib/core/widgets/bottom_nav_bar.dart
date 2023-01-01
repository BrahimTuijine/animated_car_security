import 'package:animated_car_security/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavBarChild extends HookWidget {
  const BottomNavBarChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    color: blue.withOpacity(0.2),
                    spreadRadius: 5),
              ],
            ),
            child: const Icon(
              Icons.key,
              color: white,
            ),
          ),
          const Icon(
            Icons.location_on_outlined,
            color: white,
          ),
          const Icon(
            Icons.settings,
            color: white,
          ),
          const Icon(
            Icons.person,
            color: white,
          ),
        ],
      ),
    );
  }
}
