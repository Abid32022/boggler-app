import 'package:flutter/material.dart';

Widget customExtraBold({required String title,Color color = Colors.black,TextAlign textAlign =TextAlign.start, double fontSize = 12, FontWeight fontWeight = FontWeight.normal}){
  return Text(title,style: TextStyle(
    // fontFamily: 'EnnVisions',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,

  ),
    textAlign: textAlign,
  );
}

Widget customTextBold({required String title,Color color = Colors.black,TextOverflow? overflow,TextAlign textAlign =TextAlign.start, double fontSize = 12, FontWeight fontWeight = FontWeight.normal,TextAlign align = TextAlign.start,}){
  return Text(title,style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      // fontFamily: 'EnnVisions'
    // height: 1.5,
    // wordSpacing: 5
    overflow: overflow
  ),
    textAlign: textAlign,
  );
}

Widget customTextRegular({required String title,double height = 1,double latterSpacing = 1.3 ,TextOverflow? overflow,int maxlines = 6,Color color = Colors.black,TextAlign textAlign =TextAlign.start, double fontSize = 12, FontWeight fontWeight = FontWeight.normal,TextAlign align = TextAlign.start}){
  return Text(title,style: TextStyle(
    fontSize: fontSize,
    // fontFamily: 'EnnVisions',
   // fontFamily: 'Montserrat-VariableFont_wght',
    fontWeight: fontWeight,
    color: color,
     height: height,

    letterSpacing: latterSpacing,

  ),
      maxLines: maxlines,
      overflow: overflow,
    textAlign: align,
  );
}
