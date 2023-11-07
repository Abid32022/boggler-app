import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Provider/home_provider.dart';
import 'data_time_format.dart';

class AudioBottomSheet extends StatelessWidget {
  const AudioBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width*0.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 5,
            width: 25,
            decoration:  BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15.0)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<HomeProvider>(builder: (context, comeProvider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                      // if(comeProvider.timer != null){
                      //   if(comeProvider.timer!.isActive){
                      //     comeProvider.cancelTimer();
                      //   }else{
                      //
                      //   }
                      // }else{
                      //   comeProvider.cancelTimer();
                      // }
                    },
                    child: const Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(comeProvider.timer != null){
                        if(comeProvider.timer!.isActive){
                          comeProvider.cancelTimer();
                        }else{
                          comeProvider.startTimer(context: context);
                        }
                      }else{
                        comeProvider.startTimer(context: context);
                      }

                    },
                    child:  Text(comeProvider.timer != null ? comeProvider.timer!.isActive ? "Pause": "Resume": "Start",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  )
                ],
              );
            },),
          ),
          const Divider(),
          Consumer<HomeProvider>(builder: (context, homeProvider, child) {
            return homeProvider.timer != null ?
            GestureDetector(
                onTap: (){
                  if(homeProvider.timer!.isActive){
                    homeProvider.cancelTimer();
                  }else{
                    homeProvider.startTimer(context: context);
                  }
                },
                child: Icon( homeProvider.timer!.isActive ? Icons.stop_circle : Icons.play_circle,color: Colors.red,)) :
            GestureDetector(
                onTap: (){
                  homeProvider.startTimer(context: context);
                },
                child: const Icon( Icons.play_circle,color: Colors.red)) ;
            // :  Icon(Icons.play_circle);
          },),
          const SizedBox(height: 5,),
          const CountDownTimer(),
          const SizedBox(height: 5,),
          Center(child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
            return GestureDetector(
                onTap: (){
                  if(homeProvider.timer != null){
                    // if(homeProvider.finalResponse.toString().trim().isNotEmpty){
                      homeProvider.addResponse();
                    // }else{}
                  }else{
                    // Get.to
                  }
                },
                child: const Text("Save"));
          },),)
        ],
      ),
    );
  }
}