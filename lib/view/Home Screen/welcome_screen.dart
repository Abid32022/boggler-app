import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/utils/mysize.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/widgets/custom_button.dart';
import '../../widgets/custom_text_widgets.dart';

class SelectTask extends StatefulWidget {
  @override
  State<SelectTask> createState() => _SelectTaskState();
}

class _SelectTaskState extends State<SelectTask>with TickerProviderStateMixin {
 // const SelctProject({super.key});
  late Animation<double> _animation;
  late AnimationController _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Initialize _animationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    );

    // Start the animations.
    _controller.forward();
    _animationController.forward();
  }

  void playAnimationWithDuration(Duration duration) {
    _animationController.duration = duration;
    _animationController.forward(from: 0);
  }


  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const[Colors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: Get.width,
        height: Get.height,
        child: Column(

          children: [
              SizedBox(height: MySize.size50,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            SizedBox(),
                          // SizedBox(width: 105.w,),
                          Text("Welcome",style: TextStyle(fontSize: MySize.size40,fontWeight: FontWeight.w800,color: Colors.white),),
                          // Spacer(),
                          GestureDetector(
                              onTap: (){

                              },
                              child: Icon(Icons.info,color: Colors.white,)),

                        ],
                      ),
                    ),
                      SizedBox(height: 20,),

                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        final nameBox = Hive.box<String>('nameBox'); // Access the Hive box
                        final retrievedName = nameBox.get('nameKey') ??  "Hello, Nouman"; // Use a default value if the retrieved name is null

                        return Center(
                          child: Opacity(
                            opacity: _animation.value,
                            child: customTextRegular(
                              title: retrievedName,
                              fontWeight: FontWeight.w700,
                              fontSize: MySize.size30,
                              color: AppColors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              Spacer(),
            customButton(text: "Start Boggling",ontap: (){
              // Get.offAll(() => HomeScreen());
              Get.to(()=> HomeScreen());
            },),


          ],
        ),
      ),
    );
  }
}
