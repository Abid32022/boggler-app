import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/Provider/Home%20Provider.dart';
import 'package:seven_min_track/Provider/signup_provider.dart';
import 'package:seven_min_track/view/Home%20Screen/grow_result_screen.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/view/Home%20Screen/lets_start/lets_start.dart';
import 'package:seven_min_track/view/hive_database/create_project.dart';
import 'package:seven_min_track/view/hive_database/date_model.dart';
import 'package:seven_min_track/view/hive_database/existing_data.dart';
import 'package:seven_min_track/view/hive_database/recording_model.dart';

import 'boggler/Provider/home_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProjectAdapter());
  await Hive.openBox<Project>('projects');

  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>('dataBox');

  Hive.registerAdapter(DateModelAdapter());
  await Hive.openBox<DateModel>('dateBox');

  Hive.registerAdapter(YourModelAdapter());
  await Hive.openBox<YourModel>('record');

  await Hive.openBox<String>('nameBox');

    runApp(
      MultiProvider(
          providers: [
      ChangeNotifierProvider<TimerProvider>(create: (context)=> TimerProvider()),
      ChangeNotifierProvider<SignUpProvider>(create: (context)=> SignUpProvider()),
      ChangeNotifierProvider<HomeProvider>(create: (context)=> HomeProvider()),
            // ChangeNotifierProvider(create: (_)=> HomeProvider()),

      ],
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
            home: LetsStart(),
        );
      },
    );
  }
}