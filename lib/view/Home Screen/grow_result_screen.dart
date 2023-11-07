import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GrowScreen extends StatefulWidget {
  const GrowScreen({super.key});

  @override
  State<GrowScreen> createState() => _GrowScreenState();
}

class _GrowScreenState extends State<GrowScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;



  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }



  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void playAnimationWithDuration(Duration duration) {
    _animationController.duration = duration;
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
          // gradient: LinearGradient(
          //   colors: [AppColors.blue, AppColors.lightgreen],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 200,
        ), itemBuilder: (context,index){
                return  Lottie.asset('assets/animation_ll7q5vf3.json',controller:_animationController,);

              }),
            ),
            Spacer(),

            Center(
              child: GestureDetector(
                onTap: (){
                  playAnimationWithDuration(Duration(seconds: 10));
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text('yes',style: TextStyle(fontSize: 12,color: Colors.white,),)),
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}