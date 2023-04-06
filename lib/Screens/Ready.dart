import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequencerocher/Screens/WorkoutSet.dart';

class AskReady extends StatelessWidget {
  const AskReady({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 - 50,
                ),
                const Text(
                  "Are you ready?",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Consumer<TimerModel>(
                  builder: (context, myModel, child) {
                    return Text(
                      myModel.countdown.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                      ),
                    );
                  },
                ),
                const Spacer(),
                const Divider(
                  thickness: 2,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: Text(
                      "Next: Tree Pose",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier {
  TimerModel(context) {
    MyTimer(context);
  }
  int countdown = 5;

  MyTimer(context) async {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        countdown--;
        notifyListeners();
        if (countdown == 0) {
          timer.cancel();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WorkoutSet(),
              ));
        }
      },
    );
  }
}
