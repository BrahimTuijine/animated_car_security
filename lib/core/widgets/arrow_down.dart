import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ArrowDown extends HookWidget {
  const ArrowDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refresh = useState<bool>(true);

    final controller =
        useAnimationController(duration: const Duration(milliseconds: 1500));

    final largeArrowDown = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.75, 1, curve: Curves.easeIn),
      ),
    );
    final mediumArrowDown = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.5, .75, curve: Curves.easeIn),
      ),
    );
    final smallArrowDown = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, .5, curve: Curves.easeIn),
      ),
    );

    useEffect(() {
      controller.repeat(reverse: false);
      controller.addListener(() {
        refresh.value = !refresh.value;
      });

      return null;
    }, const []);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: -5,
          child: Opacity(
            opacity: smallArrowDown.value,
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
            ),
          ),
        ),
        Opacity(
          opacity: mediumArrowDown.value,
          child: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 25,
          ),
        ),
        Positioned(
          bottom: -10,
          child: Opacity(
            opacity: largeArrowDown.value,
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
