import 'package:flutter/material.dart';
import 'package:lottery/core/config/routes.dart';
import '../core/components/my_elevated_button.dart';
import '/app_state/change_notifier.dart';
import 'package:lottery/core/utils/app_snackbar.dart';
import 'package:provider/provider.dart';
import '../core/components/my_row_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController startController;
  late TextEditingController endController;
  late TextEditingController limitController;
  @override
  void initState() {
    super.initState();
    startController = TextEditingController();
    endController = TextEditingController();
    limitController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: Text(
          "Lottery",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Consumer<AppProvider>(builder: (context, generator, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            MyRowField(
              controller: startController,
              text: "Start:",
            ),
            SizedBox(height: 40),
            MyRowField(
              controller: endController,
              text: "End:",
            ),
            SizedBox(height: 40),
            MyRowField(
              controller: limitController,
              text: "Limit:",
            ),
            SizedBox(height: 80),
            SizedBox(
              height: 60,
              width: 300,
              child: MyElevatedButton(
                  text: "Generate",
                  onPressed: (){
                    final startText = startController.text;
                    final endText = endController.text;
                    final limitText = limitController.text;
                    if (startText.isEmpty ||
                        endText.isEmpty ||
                        limitText.isEmpty) {
                      AppSnackBar.msg(
                          context, "Iltimos barcha maydonlarni to'ldiring!");
                      return;
                    }
                    final start = int.parse(startText);
                    final end = int.parse(endText);
                    final limit = int.parse(limitText);
                    generator.generate(start, end, limit);
                    Navigator.pushNamed(context, AppRoutes.generate);
                  },
              )
            )
          ],
        );
      }),),
    );
  }
}


