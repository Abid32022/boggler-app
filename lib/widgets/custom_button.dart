import 'package:flutter/material.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/utils/mysize.dart';

Widget customButton({
  double height = 53,
  double width = double.infinity,
  String text = "",
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w600,
  Color fontColor = Colors.white,
  Color color = Colors.white,
  double borderRadius = 40,
  Function ?ontap
}){
  return  GestureDetector(
    onTap: (){
    ontap!();
    },
    child: Container(
      margin: EdgeInsets.only(bottom:80 ),
      height: MySize.size40,
      width: MySize.scaleFactorHeight*127,
      decoration: BoxDecoration(
        color: AppColors.blue,
        // gradient: LinearGradient(
        //   colors: [Colors.blue, AppColors.lightgreen.withOpacity(0.50)],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
          border: Border.all(color: Colors.white,width: 1.5),
          borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,

        ),
        ),
      )
    ),
  );

  // return GestureDetector(
  //   onTap: (){
  //     ontap!();
  //   },
  //   child: Container(
  //     // padding: EdgeInsets.all(10),
  //       height: height,
  //     // width: Get.width,
  //     decoration: BoxDecoration(
  //       color: color,
  //         gradient: LinearGradient(
  //           colors: [
  //             Colors.blue,
  //             AppColors.lightgreen,
  //           ],
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //         ),
  //       borderRadius: BorderRadius.circular(borderRadius)
  //     ),
  //     child: Center(child: customTextRegular(title: Text,fontSize: fontSize,fontWeight: fontWeight,color: fontColor,latterSpacing: 1.5),),
  //   ),
  // );
}