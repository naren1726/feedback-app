import 'package:feedback/widgets.dart';
import 'package:flutter/material.dart';

class RatingComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        Text(
          "Tell us more",
          style: headingStyle(),
        ),
        SizedBox(height: 10),
        Text(
          "Your feedback will help us improve",
          style: subHeadingStyle(),
        ),
        SizedBox(height: 30),
        Container(
            margin: EdgeInsets.all(10),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Color(0xFFABA8A8), width: 2),
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              ),
            )),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: AssetImage('assets/images/feedback.png')),
            // SizedBox(height: 20),
            Text(
              "Submitted!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 20),
            Text(
              "Thank you for sharing your thoughts",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Image(
            //   image: AssetImage('assets/images/tick.jpg'),
            // ),
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
}
