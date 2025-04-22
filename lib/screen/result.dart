import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/app_state/change_notifier.dart';
import 'package:provider/provider.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: Text(
          "Result",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<AppProvider>(
        builder: (context, generator, __) {
          return Stack(children: [
            Align(
              alignment: Alignment(0, -1),
              child: SizedBox(
                width: 300,
                height: 170,
                child: Lottie.asset(
                  "assets/animation/well_anim.json",
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Align(
               alignment: Alignment(0, 0),
               child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: generator.resNumbers.map((resNumber) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Center(
                        child: Text(
                          "$resNumber",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
             ),

          ]);
        },
      ),
    );
  }
}
