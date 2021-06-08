import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  var onStarPressed;

  MyApp({this.onHeartPressed, this.isStar = false});
  final VoidCallback onHeartPressed;
  final bool isStar;

  get inputType => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.arrow_back,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Give your Review",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "How is did we serve?",
                style: proStyle(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starIcon(),
                starIcon(),
                starIcon(),
                starIcon(),
                starIcon(),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "How is our products?",
                style: proStyle(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starIcon(),
                starIcon(),
                starIcon(),
                starIcon(),
                starIcon(),
              ],
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Please your feedback here...",
                style: proStyle(),
              ),
            ),
            SizedBox(height: 10),
            Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFABA8A8), width: 2),
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: inputType,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                textStyle: TextStyle(color: Color(0xFF8BF4D0)),
                primary: Color(0xFF8BF4D0),
              ),
              child: Text(
                'PUBLISH YOUR FEEDBACK',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'WorkSansMedium'),
              ),
              onPressed: () {
                showAlertDialog(context);
              },
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Your review will be posted to Google Play store",
                style: TextStyle(
                  color: Color(0xFFABA8A8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

IconButton starIcon() {
  var onHeartPressed;
  return IconButton(
      icon: (Icons.star_border) != null
          ? Icon(
              Icons.star,
              size: 40,
              color: Color(0xFFF9D50E),
            )
          : Icon(Icons.star),
      onPressed: onHeartPressed);
}

TextStyle proStyle() {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

showAlertDialog(BuildContext context) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/feedback.png')),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Submitted!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Thank you for sharing your thoughts",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              " We appriciate your feedback!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: AssetImage('assets/images/tick.jpg')),
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
