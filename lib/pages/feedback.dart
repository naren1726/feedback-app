import 'package:feedback/constants/colors.dart';
import 'package:feedback/pages/widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isRatingGiven = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Colors.white,
        backgroundColor: Color(0xFF091D3B),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        title: Text(
          "Feedback",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            StoreCard(),
            SizedBox(height: 10),
            RateCard(
              onPressed: (rating) {
                if (!isRatingGiven)
                  setState(() {
                    isRatingGiven = true;
                  });
                print(rating);
              },
            ),
            SizedBox(height: 10),
            AnimatedCrossFade(
              crossFadeState: (isRatingGiven)
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
              firstChild: Container(),
              secondChild: RatingComments(),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
