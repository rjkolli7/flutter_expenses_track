import 'package:authentication/authentication.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';

class AuthPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsHelper.kWhite,
        body: _AuthPage(
          screenHeight: screenHeight,
        ));
  }
}

class _AuthPage extends StatefulWidget {
  final double screenHeight;

  const _AuthPage({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  @override
  State<_AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<_AuthPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> headerTextAnimation;
  late final Animation<double> formElementAnimation;
  late final Animation<double> whiteTopClipperAnimation;
  late final Animation<double> blueTopClipperAnimation;
  late final Animation<double> greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AnimationHelper.kLoginAnimationDuration,
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));
    formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    final clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );
    blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(
      headerTextAnimation: headerTextAnimation,
      formElementAnimation: formElementAnimation,
      whiteTopClipperAnimation: whiteTopClipperAnimation,
      blueTopClipperAnimation: blueTopClipperAnimation,
      greyTopClipperAnimation: greyTopClipperAnimation,
    );
  }
}
