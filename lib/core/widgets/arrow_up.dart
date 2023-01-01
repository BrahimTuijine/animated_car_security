import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ArrowUp extends HookWidget {
  const ArrowUp({super.key});

  @override
  Widget build(BuildContext context) {
    final refresh = useState<bool>(true);
    final arrowAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    final lareArrowOpacityAnimation = useMemoized(() =>
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: arrowAnimationController,
            curve: const Interval(0, .5, curve: Curves.easeIn))));

    final mediumArrowOpacityAnimation = useMemoized(() =>
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: arrowAnimationController,
            curve: const Interval(0.25, .75, curve: Curves.easeIn))));

    final smallArrowOpacityAnimation =
        useMemoized(() => Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: arrowAnimationController,
                curve: const Interval(0.75, 1, curve: Curves.easeIn),
              ),
            ));

    useEffect(() {
      arrowAnimationController.repeat(reverse: false);
      arrowAnimationController.addListener(
        () {
          refresh.value = !refresh.value;
        },
      );
      return () {};
    }, const []);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: -5,
          child: Opacity(
            opacity: smallArrowOpacityAnimation.value,
            child: const Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 20,
            ),
          ),
        ),
        Opacity(
          opacity: mediumArrowOpacityAnimation.value,
          child: const Icon(
            Icons.keyboard_arrow_up_rounded,
            size: 25,
          ),
        ),
        Positioned(
          bottom: -10,
          child: Opacity(
            opacity: lareArrowOpacityAnimation.value,
            child: const Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
