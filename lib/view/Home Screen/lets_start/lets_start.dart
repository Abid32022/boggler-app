
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:seven_min_track/utils/mysize.dart';
import 'package:seven_min_track/view/Home%20Screen/welcome_screen.dart';
import 'package:seven_min_track/widgets/custom_button.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_text_widgets.dart';
class LetsStart extends StatefulWidget {
  const LetsStart({super.key});

  @override
  State<LetsStart> createState() => _LetsStartState();
}

class _LetsStartState extends State<LetsStart> {

  TextEditingController _controller = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
       body: Container(
         padding: EdgeInsets.symmetric(horizontal: 20),
         width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
         child: Form(
           key: formkey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: MySize.size100,),

               customTextRegular(title: "Enter your name",color: AppColors.white,fontSize: 16.h,fontWeight: FontWeight.w500,),
                SizedBox(height: MySize.size20),

           AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: SizedBox(
                      // height: 50.h,
                      child: textField(
                        hintText: "Enter your name",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        isprefixImage: false,
                        controller: _controller,
                        borderRadius: 40,
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
                      ),
                    )),

               Spacer(),
                Center(
                    child: customButton(text: "Lets Start",ontap: (){
                     if (formkey.currentState!.validate()) {
                      String enteredName = _controller.text;
                      HiveBoxes.nameBox.put('nameKey', enteredName);
                      _controller.clear();
                      Get.to(() => SelectTask());
                    }
                }))
             ],
           ),
         ),
       ),
    );
  }
}









class HiveBoxes {
  static Box<String> nameBox = Hive.box<String>('nameBox');
}

