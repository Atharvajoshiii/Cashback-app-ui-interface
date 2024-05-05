import 'package:flutter/material.dart';
import 'package:todowebapp/widgets/gradientcard.dart';
import 'package:todowebapp/widgets/task.dart';

class MyEarnings extends StatelessWidget {
  const MyEarnings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Text(
          "my earnings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Move padding to body
        child: Column(
          children: [
            GradientCreditCard(
              onTopRightButtonClicked: () {},
              cardIcon: Icon(Icons.add),
            ),
            SizedBox(height: 20),
            TaskProgressCard(
              title: "My Order Details  >>",
            ),
            SizedBox(height: 20),
            TaskProgressCard(
              title: "Request Payment >>",
            ),
            SizedBox(height: 20),
            TaskProgressCard(
              title: "Get Help >>",
            ),
          ],
        ),
      ),
    );
  }
}
