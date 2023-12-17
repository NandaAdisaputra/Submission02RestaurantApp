import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission02/ui/home/home_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(JsonAssets.splash,
          controller: _controller,
          width: displayWidth(context) * FontSize.s05,
          height: displayHeight(context) * FontSize.s05,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(
                    () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              );
          },
        ),
      ),
    );
  }
}
