import 'package:animated_car_security/core/constants/colors.dart';
import 'package:animated_car_security/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(
        color: black,
        child: BottomNavBarChild(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [grey, black],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
