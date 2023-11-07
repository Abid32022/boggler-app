import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/mysize.dart';
import '../../../widgets/custom_text_widgets.dart';
class SmallIndicator extends StatefulWidget {
  final double percent;
  final bool trophy;

  const SmallIndicator({Key? key, required this.percent, required this.trophy}) : super(key: key);

  @override
  State<SmallIndicator> createState() => _SmallIndicatorState();
}

class _SmallIndicatorState extends State<SmallIndicator>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();

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
  void playAnimationWithDuration(Duration duration) {
    _animationController.duration = duration;
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final color = widget.trophy ? Color(0xff129B12) : Colors.white;
    final animationDuration =  Duration(seconds: 8);


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CircularPercentIndicator(
        radius: MySize.size22,
        backgroundColor: color,
        progressColor: Colors.white,
        lineWidth: MySize.size3,
        percent: widget.percent,
        center: widget.trophy
        // ? Image.asset("assets/icons/Tree.png",height: 27.h,width: 27.w,color: color,)

            ? Lottie.asset(
          'assets/animation_ll7q5vf3.json',
          height: 40.h,
          repeat: true, // Set this property to true for continuous repetition
          onLoaded: (composition) {
            // Set the animation duration when the Lottie animation is loaded
            playAnimationWithDuration(animationDuration);
          },
          controller:_animationController,)


            : customTextRegular(title: "",fontSize: 10.h,color: Colors.black,fontWeight: FontWeight.w500), // Hide the center if data is null
      ),
    );
  }
}
