import 'package:feedback/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        title: Text(
          "Give your Review",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/shop.jpg"),
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Vishal Super Mart,  RT-Nagar Branch',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 8.0),
                          child: Text(
                            'RT-Nagar, Church Street, Bengaluru - 560094',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Rate your Experience",
              style: headingStyle(),
            ),
            SizedBox(height: 5),
            Text(
              "Please rate your recent visit to the store",
              style: subHeadingStyle(),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 0,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                }
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            RatingComments()
          ],
        ),
      ),
    );
  }
}

TextStyle headingStyle() {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
}

TextStyle subHeadingStyle() {
  return TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );
}

  // show the dialog

