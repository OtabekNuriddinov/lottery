import 'package:flutter/material.dart';
import 'package:lottery/core/components/my_elevated_button.dart';
import 'package:lottery/core/config/routes.dart';
import '/app_state/change_notifier.dart';
import 'package:provider/provider.dart';

class Generate extends StatelessWidget {
  const Generate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        centerTitle: true,
        title: Text(
          "Generate",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                Consumer<AppProvider>(builder: (context, generator, __) {
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final number = generator.numbersList[index];
                        return Card(
                          color: Colors.grey.shade200,
                          child: Center(
                            child: Text(
                              "$number",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: generator.numbersList.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: 300,
            child: Consumer<AppProvider>(builder: (context, generator, __) {
              return MyElevatedButton(
                text: "Get Result",
                onPressed: () {
                  generator.getResult(generator.numbersList, 3);
                  generator.playWin();
                  Navigator.pushNamed(
                    context,
                    AppRoutes.result,
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
