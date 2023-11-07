import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';

import '../../../utils/mysize.dart';
class ResultScren extends StatefulWidget {
 final int length;
   const ResultScren(this.length,);

  @override
  State<ResultScren> createState() => _ResultScrenState();

}

class _ResultScrenState extends State<ResultScren>with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => HomeScreen());
    });
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

    // Start the animations.
    _animationController.forward();

    // Add a listener to the animation controller
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation has completed, stop it
        _animationController.stop();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    // print('length is ${widget.length}');
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemCount: widget.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 120,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final isLastElement = index == widget.length - 1;
              final animationDuration = isLastElement ? Duration(seconds: 4) : Duration(seconds: 8);

              return Column(
                children: [
                  Lottie.asset(
                    'assets/animation_ll7q5vf3.json',
                    fit: BoxFit.fill,
                    controller: _animationController,
                    onLoaded: (composition) {
                      // Set the animation duration when the Lottie animation is loaded
                      playAnimationWithDuration(animationDuration);
                    },
                  ),
                Container(
                  width: isLastElement ?20.w:0,
                  height: MySize.size4,
                  color: Colors.green,
                ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
  void playAnimationWithDuration(Duration duration) {
    _animationController.duration = duration;
    _animationController.forward(from: 0);
  }
}
