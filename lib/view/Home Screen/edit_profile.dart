import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/widgets/custom_button.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/mysize.dart';
import '../../widgets/custom_text_field.dart';
import 'lets_start/lets_start.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const[AppColors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            customTextRegular(title: 'Edit Name',fontSize: 24.h,color: Colors.white,fontWeight: FontWeight.w500),
            SizedBox(height: 50.h,),
            AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: SizedBox(
                  width: 360.w,
                  // height: 50.h,
                  child: textField(
                    hintText: "Enter your name",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    isprefixImage: false,
                    controller: _nameController,
                    borderRadius: 40,
                    textFieldColor: Colors.black,
                    bordercolor: AppColors.white,
                    filled: true,
                    enableborder: true,
                    isPrefixIcon: true,
                    prefixicon: Icons.mail,
                    fillcolor: Colors.white,
                    suffix: true,
                    validator: (String? input) {
                      if (input!.isEmpty) {
                        return 'Enter your name';
                      }
                      if (input.length < 4) {
                        return 'Enter your name 4+ character long';
                      }
                      return null;
                    },
                    ontap: (){},
                    onChanged: (){}
                  ),
                )),
            SizedBox(height: 50.h,),
            customButton(text: "Update",ontap: (){
              if (_nameController.text.isNotEmpty &&
                  _nameController.text.length >= 4) {
                String updatedName = _nameController.text;
                HiveBoxes.nameBox.put('nameKey', updatedName); // Update the nameKey in Hive
                _nameController.clear();// Clear the text field
                Get.back();

                // You can also navigate back or perform any other required action here
              }
            },fontWeight: FontWeight.w400,fontColor: Colors.white),

            // GestureDetector(
            //   onTap: () {
            //     if (_nameController.text.isNotEmpty &&
            //         _nameController.text.length >= 4) {
            //       String updatedName = _nameController.text;
            //       HiveBoxes.nameBox.put('nameKey', updatedName); // Update the nameKey in Hive
            //       _nameController.clear();// Clear the text field
            //       Get.back();
            //
            //       // You can also navigate back or perform any other required action here
            //     }
            //   },
            //   child: Container(
            //     height: MySize.size40,
            //     width: MySize.size120,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: Center(
            //       child: Text(
            //         "Update",
            //         style: TextStyle(
            //           fontSize: MySize.size14,
            //           color: Colors.black,
            //           fontFamily: 'RobotoMono-Bold',
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
