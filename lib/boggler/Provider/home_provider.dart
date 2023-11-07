

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/boggler/Models/data.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../View/audio_bottom_shet.dart';

class HomeProvider extends ChangeNotifier {
  // var durationFormatted ;
  final ScrollController scrollController = ScrollController();
  List<DataModel> speechModel = [];
  String finalResponse = '';
  String text = "";
  SpeechToText speechToText = SpeechToText();
  bool isListening = false;
  int secondsElapsed = 0;

  Future<void> addResponse() async {
    if (finalResponse.trim().isNotEmpty) {
      speechModel.add(DataModel(
        heading: finalResponse,
        timeDuration: '00:19',
        date: DateTime.now(),
      ));
      timer!.cancel();
      finalResponse = '';
      stopSpeech();
      Get.back();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: "Please add some voice ");
      print("response is empty");
      notifyListeners();
    }
  }

  Future<void> finalText({required String text}) async {
    if (kDebugMode) {
      print("this si final text ${finalResponse}");
    }
  }

  Timer? timer;

  void startTimer({required BuildContext context}) {
    startSpeech(context: context);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed++;
      notifyListeners();
    });
  }

  String get timerText {
    int hours = secondsElapsed ~/ 3600;
    int minutes = (secondsElapsed ~/ 60) % 60;
    int seconds = secondsElapsed % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void cancelTimer() {
    stopSpeech();
    timer!.cancel();
    // Get.back();
    notifyListeners();
    // Handle timer cancellation logic here if needed
  }

  Future<void> stopSpeech() async {
    isListening = false;
    timer!.cancel();
    speechToText.stop();
    // addResponse();
    notifyListeners();
  }

  Future<void> openBottomSheet({required BuildContext context}) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return const AudioBottomSheet();
      },
    );
  }

  Future<void> startSpeech({required BuildContext context}) async {
    isListening = true;
    var startTime = DateTime.now(); // Record start time
    var available = await speechToText.initialize();
    if (available) {
      try {
        speechToText.errorListener = (error) {
          startSpeech(context: context);
          if (kDebugMode) {
            print("Speech recognition error: $error");
          }
          // Handle speech recognition error
        };
        speechToText.listen(
          onResult: (result) {
            if (result.finalResult) {
              if (result.recognizedWords.isNotEmpty &&
                  result.recognizedWords.length > 2) {
                var endTime = DateTime.now(); // Record end time
                var durationInSeconds = endTime
                    .difference(startTime)
                    .inSeconds; // Calculate duration in seconds
                // durationFormatted = _formatDuration(durationInSeconds);
                text = result.recognizedWords;
                if (kDebugMode) {
                  print("this is final text: $text");
                  // print("Speech duration: $durationFormatted");
                }
                finalResponse += "${text.toString()}, ";
                finalText(text: finalResponse);
              } else {
                if (kDebugMode) {
                  print("Empty or incorrect words detected. Ignoring.");
                }
              }

              startSpeech(context: context);
              notifyListeners();
            } else {
              if (kDebugMode) {
                print("Intermediate result: ${result.recognizedWords}");
              }
              // Handle intermediate results if needed
            }
          },
        );
      } catch (error) {
        if (kDebugMode) {
          print("Unexpected speech recognition error: $error");
        }
        // Handle unexpected error
      }
      notifyListeners();
    } else {
      if (kDebugMode) {
        print("Speech recognition not available");
      }
      notifyListeners();
    }
  }

  String _formatDuration(int seconds) {
    var minutes = seconds ~/ 60;
    var remainingSeconds = seconds % 60;
    var formattedDuration =
        '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedDuration;
  }
}
