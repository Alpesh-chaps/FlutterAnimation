import 'package:flutter/material.dart';
class AnimationView extends StatefulWidget {
  const AnimationView({Key? key}) : super(key: key);

  @override
  State<AnimationView> createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView>  with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: false);
  late final AnimationController _controller1 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  late final Animation<AlignmentGeometry> _animation1 = Tween<AlignmentGeometry>(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ).animate(
    CurvedAnimation(
      parent: _controller1,
      curve: Curves.linear,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 130,
            left: -150,
            right: -150,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SizedBox(
                  width: 150.0,
                  height: 100.0,
                  child: Image.asset(
                    'assets/images/road.webp',
                    height: 40,
                  )),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: -150,
            right: -150,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: AlignTransition(
                alignment: _animation,
                child: SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: Image.asset(
                    'assets/images/car-gif-png-1.gif',
                    height: 40,
                  )
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            bottom:0,
            left: -150,
            right: -150,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: AlignTransition(
                alignment: _animation1,
                child: SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: Image.asset(
                      'assets/images/car-gif-png-1.gif',
                      height: 40,
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
