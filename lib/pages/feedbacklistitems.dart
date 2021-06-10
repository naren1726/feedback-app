import 'package:flutter/material.dart';

class FeedbackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feedback Responses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackListPage(title: "Responses"));
  }
}

class FeedbackListPage extends StatefulWidget {
  FeedbackListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  // Method to Submit Feedback and save it in Google Sheets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF091D3B),
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Colors.white,
        backgroundColor: Color(0xFF091D3B),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        title: Text(
          "Responses ",
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFF091D3B),
            elevation: 3.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.star, color: Colors.white),
                  Expanded(
                    child: Text(""),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Icon(Icons.message, color: Colors.white),
                  Expanded(
                    child: Text(""),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
