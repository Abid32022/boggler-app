import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/home_provider.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key});
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}
class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Text(
          homeProvider.timerText,
          style: const TextStyle(fontSize: 18),
        );
      },),
    );
  }
}