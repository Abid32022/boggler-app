import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/utils/mysize.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';
import '../../../Provider/Home Provider.dart';
import '../../../utils/app_colors.dart';
import '../../hive_database/create_project.dart';
import '../../hive_database/date_model.dart';
import '../../hive_database/existing_data.dart';
import '../../hive_database/recording_model.dart';

class LetsGoScreen extends StatefulWidget {
  final String title;
  final String description;
  final bool type;
  final int types;

  const LetsGoScreen(this.title, this.description, this.type, this.types);

  @override
  State<LetsGoScreen> createState() => _LetsGoScreenState();
}

class _LetsGoScreenState extends State<LetsGoScreen>
    with SingleTickerProviderStateMixin {

  void backButtonPressed(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  bool select = false;
  String selectedTime = "";
  bool isLock = false;
  List<double> smallIndicatorPercentages = [];
  List<bool> smallIndicatorTrophies = [];

  void updateTimerProviderState(TimerProvider timerProvider, int totalSeconds) {
    if (!timerProvider.isPlaying || timerProvider.seconds >= totalSeconds) {
      timerProvider.pauseTimer();
      timerProvider.isPlaying = false;
    }
    int minutes = (timerProvider.seconds ~/ 60);
    if (minutes < 0) {
      minutes = 0;
    }
    timerProvider.updateMinutes(minutes);
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Consumer(builder: (context,_,timer){

      return WillPopScope(
          onWillPop: () async {

            bool shouldAllowExit = await _showExitConfirmationDialog(
                withoutSave: () {

                  // Get.to(() => HomeScreen());
                  Get.offAll(HomeScreen());
                }, onSaveAndExit: () {

              if (widget.type == false) {

              } else {

              }
            });
            return shouldAllowExit;
          },

          child: Scaffold(
            body: SingleChildScrollView(
              child: Consumer<TimerProvider>(builder: (context, _, timer) {
                return Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [AppColors.blue, AppColors.lightgreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(children: [
                        SizedBox(
                          height: MySize.size50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {

                                saveDataAndNavigateBack(context);
                              },

                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                // padding: EdgeInsets.symmetric(horizontal: 20,vertical: ,),
                                height: MySize.size30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: customTextRegular(
                                        title: widget.title,
                                        color: AppColors.blackColor)),
                              ),
                            ),
                          ],
                        ),




                      ])),
                );
              }),
            ),
          ));

    });
  }
  Future<void> saveDataAndNavigateBack(BuildContext context) async {
    final yourModelBox = await Hive.openBox<YourModel>('record'); // Open the Hive box

    final yourModel = YourModel(
      title: "${widget.title}",
      nextStep: "Next Step Data is Here",
      recommendations: "Recomendation data is saved here",
      suggestions: "Here are suggestions to do(suggestions)",
      summary: "The whole Idea is about ...(summary)",
      voiceText: "Hello how are you(voicetext)dfgdf",
      bogglingTimeAndData: DateTime.now(),
      sessionId: 1,
    );

    await yourModelBox.add(yourModel);

    final savedData = yourModelBox.values.toList();
    for (final data in savedData) {
      print(data.nextStep);
    }

    Get.to(()=> HomeScreen());
  }

  Future<bool> _showExitConfirmationDialog(
      {Function? onSaveAndExit, Function? withoutSave}) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to save and exit the app?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Save and Exit'),
              onPressed: () async {
                onSaveAndExit!();
              },
            ),
            TextButton(
              child: Text('Exit Without Saving'),
              onPressed: () {
                withoutSave!();
              },
            ),
          ],
        );
      },
    );
    return result ?? false;
  }


}


