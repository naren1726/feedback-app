import 'package:feedback/constants/colors.dart';
import 'package:feedback/model/formController.dart';
import 'package:feedback/model/model.dart';
import 'package:feedback/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

class RatingComments extends StatefulWidget {
  RatingComments({this.rating});
  final String rating;

  @override
  _RatingCommentsState createState() => _RatingCommentsState();
}

class _RatingCommentsState extends State<RatingComments> {
  final _formKey = GlobalKey<FormState>();

  // TextField Controllers
  TextEditingController feedbackController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm(String rating, String feedback) {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(rating, feedback);

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback..");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          // _showSnackbar("Feedback Submitted");
          showAlertDialog(context);
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            "Tell us more",
            style: headingStyle(),
          ),
          SizedBox(height: 10),
          Text(
            "Your feedback will help us improve ",
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
                  controller: feedbackController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true)
                      return "Please enter a feedback";
                    return null;
                  })),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                primary: kBlue,
              ),
              child: Text(
                'SUBMIT YOUR FEEDBACK',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'WorkSansMedium'),
              ),
              onPressed: () {
                _submitForm(widget.rating, feedbackController.text);
              },
            ),
          ),
        ],
      ),
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
              "Thanks for the feedback",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
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

class StoreCard extends StatelessWidget {
  const StoreCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPurple,
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Image(
            image: AssetImage("assets/images/shop.jpg"),
            height: 60,
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Vishal Super Mart,  RT-Nagar Branch',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                child: Text(
                  'RT-Nagar, Church Street, Bengaluru - 560094',
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RateCard extends StatelessWidget {
  const RateCard({Key key, this.onPressed}) : super(key: key);
  final Function(double) onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kOrange,
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Rate your Experience",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please rate your recent visit to the store",
              style: subHeadingStyle(),
            ),
            SizedBox(height: 15),
            RatingBar.builder(
              initialRating: 0,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red[800],
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent[700],
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber[300],
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen[200],
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green[300],
                    );
                  default:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                }
              },
              onRatingUpdate: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
