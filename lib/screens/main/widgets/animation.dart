import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class MyClipPath extends AnimatedWidget {
  final Animation<double> animation;

  MyClipPath(this.animation,this.onTap, this.playing,)
      : super(listenable: animation);

  final Color backgroundColor = Colors.red;

  void Function() onTap;
  bool playing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Expanded(
            child: Stack(children: [
              //Center(child: ElevatedButton(onPressed: onTap, child: Text("tap"))),
              Positioned(
                  bottom: 45,
                  right: animation.value,
                  child: SvgPicture.asset(
                    "assets/wave-02.svg",
                    colorBlendMode: BlendMode.modulate,
                    width: 1000,
                  )),
              Positioned(
                  bottom: 0,
                  right: animation.value,
                  child: SvgPicture.asset(
                    "assets/wave-01.svg",
                    width: 1000,
                  )),
              Positioned(
                  bottom: 25,
                  child: Lottie.asset('assets/walk.json',
                      width: 100, height: 100, repeat: playing)),
              Positioned(
                  bottom: 25,
                  right: 10,
                  child: SvgPicture.asset(
                    "assets/images/kaba1.svg",
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  bool playing = true;
  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(duration: Duration(seconds: 10), vsync: this)
      ..repeat();

    animation = Tween<double>(begin: -500, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyClipPath(animation, () {
      if (playing) {
        _controller.stop();
        playing = false;
      } else {
        playing = true;
        _controller.repeat();
      }
      setState(() {});
    },playing);
  }
}
