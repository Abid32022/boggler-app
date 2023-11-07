
import 'package:flutter/material.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/utils/mysize.dart';


Widget textField({
  bool showtext =true,
  String? hintText,
  FontWeight fontWeight = FontWeight.w400,
  TextEditingController? controller,
  Function ? validator,
  double fontSize = 14,
  Color bordercolor = Colors.black,
  int maxLines  = 1,
  bool ?isprefixImage=false,
 // String? prefixImage ,
  bool? suffix = false,
  bool enableborder = false,
  Widget? suffixWidget,
  bool? isObscure = false,
  Color fillcolor  =Colors.white,
  bool filled  = false,
  double borderRadius =8,
  bool nonborder = false,
  Function? ontap,
  // bool Ontap = false,
  bool isKeyboard = false,
  Function? onChanged,
  bool showErrorBorder = false,
  double errorBorderWidth = 2.0,
  bool isPrefixIcon = true,
  bool focusBorder = false,
  Widget? prefixImage,
  Color textFieldColor = AppColors.blue,
  IconData prefixicon = Icons.mail,
  bool noOutlineBorder = true,
})
{

  return TextFormField(

      onTap:(){
        ontap!();
      },
      // onChanged: (text){
      //   onChanged!();
      // },

      controller: controller,
    validator: (value) {
      return validator!(value);
    },
    keyboardType:isKeyboard? TextInputType.number:TextInputType.text,
    maxLines: maxLines,
    obscureText: isObscure!,
    cursorColor: focusBorder? Colors.yellow:null,
      style: TextStyle(fontSize: MySize.size18,fontWeight: FontWeight.w400,color: textFieldColor),
    // style: focusBorder?  const TextStyle(color: Colors.yellow,fontSize: 9):null,
    decoration: noOutlineBorder? InputDecoration(

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red,width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      filled: filled,
      fillColor:fillcolor,
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red,width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      enabledBorder:enableborder?  OutlineInputBorder(
        borderSide: BorderSide(color: bordercolor,width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ): OutlineInputBorder(
        borderSide: BorderSide(color: bordercolor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

      hintText: showtext?  hintText:null,
      prefixIcon: prefixImage,
      focusedBorder:enableborder?  OutlineInputBorder(
        borderSide: BorderSide(color: bordercolor,width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ): OutlineInputBorder(
        borderSide: BorderSide(color: bordercolor,width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      suffixIcon: suffix! ? suffixWidget : null,
      hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: fontSize,color: Colors.grey,height: 1,fontFamily: 'Poppins'),
    ):InputDecoration(

      hintText: hintText,
      hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: fontSize,color: Colors.white,height: 1,fontFamily: 'Poppins'),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color:  AppColors.brownColor56.withOpacity(0.25), // Color for the enabled underline border
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.brownColor56.withOpacity(0.25), // Color for the focused underline border
        ),
      ),
      suffixIcon: suffixWidget,
    )
  );
}
